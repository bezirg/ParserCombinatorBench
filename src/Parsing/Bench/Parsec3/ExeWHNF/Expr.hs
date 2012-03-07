module Main where

import Parsing.Bench.Parsec3.Expr
import Parsing.Bench.Parsec3.Base

main = do
  inp <- readFile "data/expr/bench.expr"
  print $ succeeded $ run inp

