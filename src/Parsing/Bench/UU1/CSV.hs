{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU1.CSV where

import Parsing.Bench.UU1.Base
import UU.Parsing hiding (Parser)
import qualified UU.Parsing.Interface
import UU.Parsing.CharParser

pCSV :: Parser [[String]]
pCSV = pEndSep eol line
line :: Parser [String]
line = pList1Sep (pSym ',') cell
cell :: Parser String
cell = quotedCell <|> pList1 (pNoneSym ",\n\r")

quotedCell :: Parser String
quotedCell = 
       pSym '"' *>
       pList quotedChar <*
       (pSym '"' <?> "quote at end of cell")

quotedChar :: Parser Char
quotedChar =
        pNoneSym "\""
    <|> pToks "\"\"" *> pSucceed '"'

eol :: Parser String
eol =   pToks "\n\r"
    <|> pToks "\r\n"
    <|> pToks "\n"
    <|> pToks "\r"
    <?> "end of line"

