module Main where

import Parsing.Bench.UU2.CSV
import Parsing.Bench.UU2.Base

main = do
  inp <- readFile "data/csv/bench.csv"
  print $ succeeded $ run inp

