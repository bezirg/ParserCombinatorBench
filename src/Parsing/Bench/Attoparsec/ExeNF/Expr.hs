module Main where

import Parsing.Bench.Attoparsec.Expr
import qualified Data.Text.IO as TIO

main = do
  inp <- TIO.readFile "data/expr/bench.expr"
  print $ run inp

