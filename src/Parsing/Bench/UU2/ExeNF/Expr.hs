module Main where

import Parsing.Bench.UU2.Expr

main = do
  inp <- readFile "data/expr/bench.expr"
  print $ run inp

