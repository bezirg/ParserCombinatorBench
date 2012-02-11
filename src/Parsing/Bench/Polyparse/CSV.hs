module Parsing.Bench.Polyparse.CSV where

import Parsing.Bench.Polyparse.Base

import Text.Parse

pCSV = endBy line eol
line = sepBy cell (pSym ',')
cell = quotedCell <|> many (noneOf ",\n\r")

quotedCell = 
    do pSym '"'
       content <- many quotedChar
       pSym '"' <?> "quote at end of cell"
       return content

-- removed the try constructs
quotedChar =
        noneOf "\""
    <|> (string ( "\"\"") >> return '"')

-- removed the try constructs
eol =   (string ( "\n\r"))
    <|> (string ( "\r\n"))
    <|> string ( "\n")
    <|> string ( "\r")
    <?> "end of line"
