{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU1.URL where

import Parsing.Bench.UU1.Base
import UU.Parsing hiding (Parser)
import qualified UU.Parsing.Interface
import UU.Parsing.CharParser
import Numeric (readHex)

-- taken from RWH

pURL :: Parser [(String, Maybe String)]
pURL = pListSep (pSym '&') p_pair

p_pair :: Parser (String, Maybe String)
p_pair = pList1 p_char <+> optionMaybe (pSym '=' *> pList p_char)

p_char :: Parser Char
p_char = pAnySym urlBaseChars
     <|> (pSym '+' *> pSucceed ' ')
     <|> p_hex

urlBaseChars = ['a'..'z']++['A'..'Z']++['0'..'9']++"$-_.!*'(),"

p_hex :: Parser Char
p_hex = 
  (\ a b -> toEnum $ fst $ head $ readHex [a,b]) <$
  pSym '%' <*>
  hexDigit <*>
  hexDigit

run = run' pURL