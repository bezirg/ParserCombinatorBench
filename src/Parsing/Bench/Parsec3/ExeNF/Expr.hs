module Main where

import Parsing.Bench.Parsec3.Expr

main = do
  inp <- readFile "data/expr/bench.expr"
  print $ run inp

