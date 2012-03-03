module Parsing.Bench.Parsec2.CSV where

-- from RWH
import Parsing.Bench.Parsec2.Base

pCSV = endBy line eol
line = sepBy cell (char ',')
cell = many (noneOf ",\n\r")

eol =   try (string "\n\r")
    <|> try (string "\r\n")
    <|> string "\n"
    <|> string "\r"

run = run' pCSV