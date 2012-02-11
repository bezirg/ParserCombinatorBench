{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU2.CSS where

import Parsing.Bench.UU2.Base
import Text.ParserCombinators.UU
import Text.ParserCombinators.UU.Derived
import Text.ParserCombinators.UU.BasicInstances
import Text.ParserCombinators.UU.Utils
import Data.Function (on)

pCSS :: Parser [(String, [(String, String)])]
pCSS = pBlocks

-- Blocks -> Block*
pBlocks :: Parser [(String, [(String, String)])]
pBlocks = pList (skipWS *> pBlock)

-- Block -> Selectors '{' Properties '}'
pBlock :: Parser (String, [(String, String)])
pBlock = (,) <$> pSelectors <*> pBraces pProps

-- Selectors -> string
pSelectors :: Parser String
pSelectors = strip <$> pUpto "{"

-- Properties -> Prop ';' Properties | ε
pProps :: Parser [(String, String)]
pProps = skipWS *> pList (pProp <* skipWS)

-- Property -> Key ':' Value
pProp :: Parser (String, String)
pProp = ((,) `on` strip) <$> pKey <* pSym ':' <*> pValue <* (pSemi `opt` undefined)

-- Key -> string
pKey :: Parser String
pKey = (:) <$> pNoneSym "}" <*> pUpto  ":"

-- Value -> string
pValue :: Parser String
pValue = pUpto ";}"

skipWS :: Parser ()
skipWS = pSpaces *>
         (pToken "/*" *> endComment *> skipWS
          <<|> pure ())
    where
      endComment = pMunch (`notElem` "*") *>
                   pSym '*' *>
                   (pSym '/' *> pure () <<|> endComment)

pSemi :: Parser Char
pSemi = lexeme $ pSym ';'


pUpto cs = pMunch (`notElem` cs)

run = run' pCSS