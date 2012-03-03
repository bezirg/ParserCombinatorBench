module Parsing.Bench.Parsec3.CSV where

-- from RWH

import Parsing.Bench.Parsec3.Base
import Text.Parsec
import Text.Parsec.String (Parser)

pCSV :: Parser [[String]]
pCSV = endBy line eol
line = sepBy cell (char ',')
cell = many (noneOf ",\n\r")

eol = try (string "\r\n")       -- MS
      <|> string "\n"           -- Unix
      <|> string "\r"           -- MacOS

run = run' pCSV