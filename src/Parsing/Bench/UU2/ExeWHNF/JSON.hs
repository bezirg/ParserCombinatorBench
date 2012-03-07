module Main where

import Parsing.Bench.UU2.JSON
import Parsing.Bench.UU2.Base

main = do
  inp <- readFile "data/json/bench.json"
  print $ succeeded $ run inp

