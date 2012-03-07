module Main where

import Parsing.Bench.Parsec2.Expr
import Parsing.Bench.Parsec2.Base

main = do
  inp <- readFile "data/expr/bench.expr"
  print $ succeeded $ run inp

