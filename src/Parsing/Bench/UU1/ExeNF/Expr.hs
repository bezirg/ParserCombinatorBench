module Main where

import Parsing.Bench.UU1.Expr

main = do
  inp <- readFile "data/expr/bench.expr"
  print $ run inp

