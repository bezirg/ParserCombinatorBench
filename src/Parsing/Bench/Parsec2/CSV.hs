module Parsing.Bench.Parsec2.CSV where

-- from RWH
import Parsing.Bench.Parsec2.Base

pCSV = endBy line eol
line = sepBy cell (char ',')
cell = many (noneOf ",\n\r")

eol = try (string "\r\n")       -- MS
      <|> string "\n"           -- Unix
      <|> string "\r"           -- MacOS

run = run' pCSV