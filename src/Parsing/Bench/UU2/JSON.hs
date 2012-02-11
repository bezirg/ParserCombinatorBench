{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU2.JSON where

import Parsing.Bench.AST.JSON
import Parsing.Bench.UU2.Base
import Text.ParserCombinators.UU
import Text.ParserCombinators.UU.Derived
import Text.ParserCombinators.UU.BasicInstances
import Text.ParserCombinators.UU.Utils

import Numeric

pJSON :: Parser JValue
pJSON = spaces *> text <* pEnd
     <?> "JSON text"
    where text = JObject <$> p_object
             <|> JArray <$> p_array


p_series :: Char -> Parser a -> Char -> Parser [a]
p_series left parser right =
    pPacked (pSym left <* spaces) (pSym right) $
            pListSep (pSym ',' <* spaces) (parser <* spaces) 

p_array :: Parser (JAry JValue)
p_array = JAry <$> p_series '[' p_value ']'

p_object :: Parser (JObj JValue)
p_object = JObj <$> p_series '{' p_field '}'
    where 
      p_field :: Parser (String, JValue)
      p_field = (,) <$> (p_string <* pSym ':' <* spaces) <*> p_value

p_value :: Parser JValue
p_value = value <* spaces
  where value = JString <$> p_string
            <|> JNumber <$> p_number
            <|> JObject <$> p_object
            <|> JArray <$> p_array
            <|> JBool <$> p_bool
            <|> JNull <$ pToken "null"
            <?> "JSON value"

p_bool :: Parser Bool
p_bool = True <$ pToken "true"
     <|> False <$ pToken "false"

p_value_choice :: Parser JValue
p_value_choice = value <* spaces
  where value = choice [ JString <$> p_string
                     , JNumber <$> p_number
                     , JObject <$> p_object
                     , JArray <$> p_array
                     , JBool <$> p_bool
                     , JNull <$ pToken "null"
                     ]
                <?> "JSON value"

p_number :: Parser Double
p_number = pDouble

p_string :: Parser String
p_string = pPacked (pSym '\"') (pSym '\"') (many jchar)
    where jchar = pSym '\\' *> (p_escape <|> p_unicode)
              <|> pSatisfy (`notElem` "\"\\") (Insertion "" 'a' 5)

p_escape :: Parser Char
p_escape = choice (zipWith decode "bnfrt\\\"/" "\b\n\f\r\t\\\"/")
    where decode c r = r <$ pSym c

p_unicode :: Parser Char
p_unicode = pSym 'u' *> (decode <$> pExact 4 hexDigit)
    where decode x = toEnum code
              where ((code,_):_) = readHex x

run = run' pJSON