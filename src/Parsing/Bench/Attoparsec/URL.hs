module Parsing.Bench.Attoparsec.URL where

import Parsing.Bench.Attoparsec.Base
import Data.Attoparsec.Text
import Control.Applicative
import qualified Data.Text as T

import Numeric (readHex)

-- taken from RWH

pURL :: Parser [(String, Maybe String)]
pURL = p_pair `sepBy` char '&'

-- p_pair :: Parser (String, Maybe String)
-- p_pair = (,) <$> many1 p_char <*> (Just <$
--          char '=' <*>  many1 p_char <|>
--          pure Nothing)

p_pair :: Parser (String, Maybe String)
p_pair = do
  name <- many1 p_char
  value <- optionMaybe (char '=' >> many p_char)
  return (name, value)


p_char :: Parser Char
p_char = oneOf urlBaseChars
     <|> (char '+' >> return ' ')
     <|> p_hex

--urlBaseChars = ['a'..'z']++['A'..'Z']++['0'..'9']++"$-_.!*'()," -- breaks a lot

--urlBaseChars = ['a'..'z']++['A'..'Z']++['0'..'9']++"$_-.!*'()," -- breaks the - char

urlBaseChars = ['a'..'z']++['A'..'Z']++['0'..'9']++"$.!*'_(),-"

p_hex :: Parser Char
p_hex = do
  char '%'
  a <- hexDigit
  b <- hexDigit
  let ((d, _):_) = readHex [a,b]
  return . toEnum $ d
