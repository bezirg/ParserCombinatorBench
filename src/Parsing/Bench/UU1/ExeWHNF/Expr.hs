module Main where

import Parsing.Bench.UU1.Expr
import Parsing.Bench.UU1.Base

main = do
  inp <- readFile "data/expr/bench.expr"
  print $ succeeded $ run inp

