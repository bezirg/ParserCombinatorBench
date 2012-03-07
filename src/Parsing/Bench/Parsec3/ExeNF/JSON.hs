module Main where

import Parsing.Bench.Parsec3.JSON

main = do
  inp <- readFile "data/json/bench.json"
  print $ run inp

