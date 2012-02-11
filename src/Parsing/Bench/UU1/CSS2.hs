{-# LANGUAGE MagicHash #-}
module Parsing.Bench.UU1.CSS2 where

import UU.Parsing hiding (Parser)
import qualified UU.Parsing.Interface
import UU.Parsing.CharParser
import Data.Function (on)
import Data.Char

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


-- Utility Stuff

type Parser a = UU.Parsing.Interface.Parser Char a

-- if using Data.Text, this function is provided
-- and is more efficient
strip      :: String -> String
strip      = f . f
    where f = reverse . dropWhile isSpace

allChars = (chr 1, chr 127, ' ')

pNoneSym :: [Char] -> Parser Char
pNoneSym cs = allChars `pExcept` cs

lexeme p = p <* pSpaces

pSpaces :: Parser String
pSpaces = pList $ pAnySym " \r\n\t" <?> "Whitespace"

pSemi :: Parser Char
pSemi = lexeme $ pSym ';'

pBraces = pPacked (pSym '{') (pSym '}')

pUpto cs = pList (pNoneSym cs)

run' :: Parser a -> String -> Either [String] a
run' = execParser

run = run' pCSS

execParser p tks
  = if null msgs
    then final `seq` Right v
    else Left (map show msgs)
  where
    steps = parse p tks
    msgs  = getMsgs steps
    (Pair v final) = evalSteps steps


