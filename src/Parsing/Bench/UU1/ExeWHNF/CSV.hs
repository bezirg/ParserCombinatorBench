module Main where

import Parsing.Bench.UU1.CSV
import Parsing.Bench.UU1.Base

main = do
  inp <- readFile "data/csv/bench.csv"
  print $ succeeded $ run inp

