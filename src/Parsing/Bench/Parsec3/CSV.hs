module Parsing.Bench.Parsec3.CSV where

-- from RWH
import Parsing.Bench.Parsec3.Base
import Text.Parsec
import Text.Parsec.String (Parser)

pCSV :: Parser [[String]]
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
    <|> try (string "\"\"" >> return '"')

eol =   try (string "\n\r")
    <|> try (string "\r\n")
    <|> string "\n"
    <|> string "\r"
    <?> "end of line"

run = run' pCSV