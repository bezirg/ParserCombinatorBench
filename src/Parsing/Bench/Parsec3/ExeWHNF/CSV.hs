module Main where

import Parsing.Bench.Parsec3.CSV
import Parsing.Bench.Parsec3.Base

main = do
  inp <- readFile "data/csv/bench.csv"
  print $ succeeded $ run inp

