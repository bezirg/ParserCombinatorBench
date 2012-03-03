module Parsing.Bench.Polyparse.CSV where

import Parsing.Bench.Polyparse.Base

import Text.Parse

pCSV = many line
line = sepBy cell (pSym ',') <* eol
cell = many (noneOf ",\n\r")

eol =   string ( "\r\n") <|>    -- MS
        string ( "\n") <|>      -- Unix
        string ( "\r")          -- MacOS

run = run' pCSV