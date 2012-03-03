{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU1.CSV where

import Parsing.Bench.UU1.Base
import UU.Parsing hiding (Parser)
import qualified UU.Parsing.Interface
import UU.Parsing.CharParser

pCSV :: Parser [[String]]
pCSV = pList line

line :: Parser [String]
line = pList1Sep (pSym ',') cell <* eol

cell :: Parser String
cell = pList (pNoneSym ",\n\r")

eol :: Parser String
eol =   pToks "\n\r"
    <|> pToks "\r\n"
    <|> pToks "\n"
    <|> pToks "\r"

run = run' pCSV