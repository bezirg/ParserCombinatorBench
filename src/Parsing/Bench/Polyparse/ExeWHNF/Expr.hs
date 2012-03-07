module Main where

import Parsing.Bench.Polyparse.Expr
import Parsing.Bench.Polyparse.Base

main = do
  inp <- readFile "data/expr/bench.expr"
  print $ succeeded $ run inp

