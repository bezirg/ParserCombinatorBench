module Main where

import Parsing.Bench.UU2.Expr
import Parsing.Bench.UU2.Base

main = do
  inp <- readFile "data/expr/bench.expr"
  print $ succeeded $ run inp

