module Parsing.Bench.Parsec3.URL where

import Parsing.Bench.Parsec3.Base

import Text.Parsec
import Text.Parsec.String (Parser)
import Data.Functor.Identity (Identity)
import Control.Monad
import Numeric (readHex)

-- taken from RWH

pURL :: Parser [(String, Maybe String)]
pURL = p_pair `sepBy` char '&'

p_pair :: Parser (String, Maybe String)
p_pair = do
  name <- many1 p_char
  value <- optionMaybe (char '=' >> many p_char)
  return (name, value)

p_char :: Parser Char
p_char = oneOf urlBaseChars
     <|> (char '+' >> return ' ')
     <|> p_hex

urlBaseChars = ['a'..'z']++['A'..'Z']++['0'..'9']++"$-_.!*'(),"

p_hex :: Parser Char
p_hex = do
  char '%'
  a <- hexDigit
  b <- hexDigit
  let ((d, _):_) = readHex [a,b]
  return . toEnum $ d
