{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU2.URL where

import Data.Set
import Parsing.Bench.UU2.Base
import Text.ParserCombinators.UU
import Text.ParserCombinators.UU.Derived
import Text.ParserCombinators.UU.BasicInstances
import Text.ParserCombinators.UU.Utils
import Numeric (readHex)

-- taken from RWH

pURL :: Parser [(String, Maybe String)]
pURL = pListSep (pSym '&') p_pair

p_pair :: Parser (String, Maybe String)
p_pair = (,) <$> pList1 p_char <*> optionMaybe (pSym '=' *> pList p_char)

p_char :: Parser Char
p_char = pAnyOrd urlBaseChars
     <|> (pSym '+' *> pure ' ')
     <|> p_hex

urlBaseChars = ['a'..'z']++['A'..'Z']++['0'..'9']++"$-_.!*'(),"

p_hex :: Parser Char
p_hex = 
  (\ a b -> toEnum $ fst $ head $ readHex [a,b]) <$
  pSym '%' <*>
  hexDigit <*>
  hexDigit

run = run' pURL


-- a fast way to create a parser that recognizes a big number of characters
-- using BST lookup / Set membership
pAnyOrd set = let map = fromList set
              in pSatisfy (`member` map) (Insertion "" 'a' 5)