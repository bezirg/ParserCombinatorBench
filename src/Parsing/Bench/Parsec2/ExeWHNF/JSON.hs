module Main where

import Parsing.Bench.Parsec2.JSON
import Parsing.Bench.Parsec2.Base

main = do
  inp <- readFile "data/json/bench.json"
  print $ succeeded $ run inp

