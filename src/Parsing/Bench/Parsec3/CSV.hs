module Parsing.Bench.Parsec3.CSV where

-- from RWH

import Parsing.Bench.Parsec3.Base
import Text.Parsec
import Text.Parsec.String (Parser)

pCSV :: Parser [[String]]
pCSV = endBy line eol
line = sepBy cell (char ',')
cell = many (noneOf ",\n\r")

eol =   try (string "\n\r")
    <|> try (string "\r\n")
    <|> string "\n"
    <|> string "\r"

run = run' pCSV