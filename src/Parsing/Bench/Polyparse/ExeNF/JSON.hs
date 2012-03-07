module Main where

import Parsing.Bench.Polyparse.JSON

main = do
  inp <- readFile "data/json/bench.json"
  print $ run inp

