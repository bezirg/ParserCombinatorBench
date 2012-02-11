{-# LANGUAGE MagicHash #-}
module Parsing.Bench.UU1.CSS where

import Parsing.Bench.UU1.Base
import UU.Parsing hiding (Parser)
import qualified UU.Parsing.Interface
import UU.Parsing.CharParser
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
         (pToks "/*" *> endComment *> skipWS <* pCost 1#
          <|> pSucceed () <* pCost 2#)
    where
      endComment = pUpto "*" *>
                   pSym '*' *>
                   (pSym '/' *> pSucceed () <* pCost 1# <|> endComment <* pCost 2#)

pSemi :: Parser Char
pSemi = lexeme $ pSym ';'

pBraces = pPacked (pSym '{') (pSym '}')

pUpto cs = pList (pNoneSym cs)

