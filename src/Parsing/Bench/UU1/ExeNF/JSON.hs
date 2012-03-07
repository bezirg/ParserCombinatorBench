module Main where

import Parsing.Bench.UU1.JSON

main = do
  inp <- readFile "data/json/bench.json"
  print $ run inp

