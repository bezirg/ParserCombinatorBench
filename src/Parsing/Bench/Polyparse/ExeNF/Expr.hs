module Main where

import Parsing.Bench.Polyparse.Expr

main = do
  inp <- readFile "data/expr/bench.expr"
  print $ run inp

