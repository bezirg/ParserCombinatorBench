module Main where

import Parsing.Bench.Polyparse.JSON
import Parsing.Bench.Polyparse.Base

main = do
  inp <- readFile "data/json/bench.json"
  print $ succeeded $ run inp

