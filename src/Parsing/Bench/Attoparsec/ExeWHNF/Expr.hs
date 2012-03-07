module Main where

import Parsing.Bench.Attoparsec.Expr
import Parsing.Bench.Attoparsec.Base

import qualified Data.Text.IO as TIO

main = do
  inp <- TIO.readFile "data/expr/bench.expr"
  print $ succeeded $ run inp

