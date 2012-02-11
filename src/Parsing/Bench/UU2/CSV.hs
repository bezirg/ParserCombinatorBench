{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU2.CSV where

import Parsing.Bench.UU2.Base
import Text.ParserCombinators.UU
import Text.ParserCombinators.UU.Derived
import Text.ParserCombinators.UU.BasicInstances
import Text.ParserCombinators.UU.Utils

pCSV :: Parser [[String]]
pCSV = pEndSep eol line

line :: Parser [String]
line = pList1Sep (pSym ',') cell

cell :: Parser String
cell = quotedCell <|> pList1 (pNoneSym ",\n\r")

quotedCell :: Parser String
quotedCell = 
    pSym '"' *>
    pMany quotedChar <*
    pSym '"' <?> "quote at end of cell"


quotedChar :: Parser Char
quotedChar =
        pNoneSym "\""
    <|> (pToken "\"\"" >> return '"')

eol :: Parser String
eol =   pToken "\n\r"
    <|> pToken "\r\n"
    <|> pToken "\n"
    <|> pToken "\r"
    <?> "end of line"

run = run' pCSV