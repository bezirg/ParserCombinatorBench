module Main where

import Parsing.Bench.Parsec3.JSON
import Parsing.Bench.Parsec3.Base

main = do
  inp <- readFile "data/json/bench.json"
  print $ succeeded $ run inp

