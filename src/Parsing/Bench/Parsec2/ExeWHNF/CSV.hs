module Main where

import Parsing.Bench.Parsec2.CSV
import Parsing.Bench.Parsec2.Base

main = do
  inp <- readFile "data/csv/bench.csv"
  print $ succeeded $ run inp

