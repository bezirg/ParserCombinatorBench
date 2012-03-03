{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU2.CSV where

import Parsing.Bench.UU2.Base
import Text.ParserCombinators.UU
import Text.ParserCombinators.UU.Derived
import Text.ParserCombinators.UU.BasicInstances
import Text.ParserCombinators.UU.Utils

pCSV :: Parser [[String]]
pCSV = pList line

line :: Parser [String]
line = pList1Sep (pSym ',') cell <* eol

cell :: Parser String
cell = pMunch (`notElem` ",\n\r")


eol :: Parser String
eol = pToken "\r\n" <|>         -- MS
      pToken "\n" <|>           -- Unix
      pToken "\r"               -- MacOS

run = run' pCSV