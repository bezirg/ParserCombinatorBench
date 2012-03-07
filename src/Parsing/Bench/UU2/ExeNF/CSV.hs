module Main where

import Parsing.Bench.UU2.CSV

main = do
  inp <- readFile "data/csv/bench.csv"
  print $ run inp

