module Parsing.Bench.Polyparse.URL where

import Data.Set
import Parsing.Bench.Polyparse.Base
import Text.Parse
import Numeric (readHex)

-- taken from RWH

pURL :: TextParser [(String, Maybe String)]
pURL = p_pair `sepBy` pSym '&'

p_pair :: TextParser (String, Maybe String)
p_pair = do
  name <- many1 p_char
  value <- optionMaybe (pSym '=' >> many p_char)
  return (name, value)

p_char :: TextParser Char
p_char = pAnyOrd urlBaseChars -- pAnySym urlBaseChars
     <|> (pSym '+' >> return ' ')
     <|> p_hex

urlBaseChars = ['a'..'z']++['A'..'Z']++['0'..'9']++"$-_.!*'(),"

p_hex :: TextParser Char
p_hex = do
  pSym '%'
  a <- hexDigit
  b <- hexDigit
  let ((d, _):_) = readHex [a,b]
  return . toEnum $ d


-- a fast way to create a parser that recognizes a big number of characters
-- using BST lookup / Set membership
pAnyOrd set = let map = fromList set
              in satisfy (`member` map)


run = run' pURL