module Main where

import Parsing.Bench.Polyparse.CSV

main = do
  inp <- readFile "data/csv/bench.csv"
  print $ run inp

