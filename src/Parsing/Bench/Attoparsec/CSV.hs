module Parsing.Bench.Attoparsec.CSV where

import Parsing.Bench.Attoparsec.Base

import Data.Attoparsec.Text
import Control.Applicative
import qualified Data.Text as T

pCSV = endBy line eol
line = sepBy cell (char ',')
cell = quotedCell <|> many (noneOf ",\n\r")

quotedCell = 
    do char '"'
       content <- many quotedChar
       char '"' <?> "quote at end of cell"
       return content

quotedChar =
        noneOf "\""
    <|> try (string (T.pack "\"\"") >> return '"')

eol =   try (string (T.pack "\n\r"))
    <|> try (string (T.pack "\r\n"))
    <|> string (T.pack "\n")
    <|> string (T.pack "\r")
    <?> "end of line"
