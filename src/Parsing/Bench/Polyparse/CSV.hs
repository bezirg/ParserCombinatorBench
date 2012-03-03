module Parsing.Bench.Polyparse.CSV where

import Parsing.Bench.Polyparse.Base

import Text.Parse

pCSV = many line
line = sepBy cell (pSym ',') <* eol
cell = many (noneOf ",\n\r")

eol =   string ( "\n\r") <|> 
        string ( "\r\n") <|>
        string ( "\n") <|>
        string ( "\r")

run = run' pCSV