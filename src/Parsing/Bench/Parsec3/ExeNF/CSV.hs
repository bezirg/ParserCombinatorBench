module Main where

import Parsing.Bench.Parsec3.CSV

main = do
  inp <- readFile "data/csv/bench.csv"
  print $ run inp

