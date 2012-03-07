module Main where

import Parsing.Bench.UU1.JSON
import Parsing.Bench.UU1.Base

main = do
  inp <- readFile "data/json/bench.json"
  print $ succeeded $ run inp

