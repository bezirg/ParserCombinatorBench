module Parsing.Bench.Polyparse.JSON where

import Parsing.Bench.AST.JSON
import Parsing.Bench.Polyparse.Base
import Text.Parse

import Numeric

pJSON :: TextParser JValue
pJSON = spaces *> text <* eof
    where text = JObject <$> p_object
             <|> JArray <$> p_array


p_series :: Char -> TextParser a -> Char -> TextParser [a]
p_series left parser right =
    between (pSym left <* spaces) (pSym right) $
                (parser <* spaces) `sepBy` (pSym ',' <* spaces)

p_array :: TextParser (JAry JValue)
p_array = JAry <$> p_series '[' p_value ']'

p_object :: TextParser (JObj JValue)
p_object = JObj <$> p_series '{' p_field '}'
    where p_field = (,) <$> (p_string <* pSym ':' <* spaces) <*> p_value

p_value :: TextParser JValue
p_value = value <* spaces <?> "JSON value"
  where value = JString <$> p_string
            <|> JNumber <$> p_number
            <|> JObject <$> p_object
            <|> JArray <$> p_array
            <|> JBool <$> p_bool
            <|> JNull <$ string "null"

p_bool :: TextParser Bool
p_bool = True <$ string "true"
     <|> False <$ string "false"

p_number :: TextParser Double
p_number = parseSigned parseFloat

p_string :: TextParser String
p_string = between (pSym '\"') (pSym '\"') (many jchar) <* spaces
    where jchar = pSym '\\' *> (p_escape <|> p_unicode)
              <|> satisfy (`notElem` "\"\\")

p_escape = oneOf (zipWith decode "bnfrt\\\"/" "\b\n\f\r\t\\\"/")
    where decode c r = r <$ pSym c

p_unicode :: TextParser Char
p_unicode = pSym 'u' *> (decode <$> exactly 4 hexDigit)
    where decode x = toEnum code
              where ((code,_):_) = readHex x

run = run' pJSON