module Main where

import Parsing.Bench.Parsec2.JSON

main = do
  inp <- readFile "data/json/bench.json"
  print $ run inp

