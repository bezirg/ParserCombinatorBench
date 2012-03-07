module Main where

import Parsing.Bench.Polyparse.CSV
import Parsing.Bench.Polyparse.Base

main = do
  inp <- readFile "data/csv/bench.csv"
  print $ succeeded $ run inp

