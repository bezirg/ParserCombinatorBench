{-# LANGUAGE OverloadedStrings #-}

module Parsing.Bench.Attoparsec.JSON where

import Parsing.Bench.AST.JSON
import Parsing.Bench.Attoparsec.Base

import Data.Attoparsec.Text
import Control.Applicative
import qualified Data.Text as T

import Numeric

pJSON :: Parser JValue
pJSON = spaces *> text <* endOfInput
     <?> "JSON text"
    where text = JObject <$> p_object
             <|> JArray <$> p_array


p_series :: Char -> Parser a -> Char -> Parser [a]
p_series left parser right =
    between (char left <* spaces) (char right) $
            (parser <* spaces) `sepBy` (char ',' <* spaces)

p_array :: Parser (JAry JValue)
p_array = JAry <$> p_series '[' p_value ']'

p_object :: Parser (JObj JValue)
p_object = JObj <$> p_series '{' p_field '}'
    where p_field = (,) <$> (p_string <* char ':' <* spaces) <*> p_value

p_value :: Parser JValue
p_value = value <* spaces
  where value = JString <$> p_string
            <|> JNumber <$> p_number
            <|> JObject <$> p_object
            <|> JArray <$> p_array
            <|> JBool <$> p_bool
            <|> JNull <$ string "null"
            <?> "JSON value"

p_bool :: Parser Bool
p_bool = True <$ string "true"
     <|> False <$ string "false"

p_number :: Parser Double
p_number = double


p_string :: Parser String
p_string = between (char '\"') (char '\"') (many jchar)
    where jchar = char '\\' *> (p_escape <|> p_unicode)
              <|> noneOf "\"\\"

p_escape = choice (zipWith decode "bnfrt\\\"/" "\b\n\f\r\t\\\"/")
    where decode c r = r <$ char c

p_unicode :: Parser Char
p_unicode = char 'u' *> (decode <$> count 4 hexDigit)
    where decode x = toEnum code
              where ((code,_):_) = readHex x

run = run' pJSON