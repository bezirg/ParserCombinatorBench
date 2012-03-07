module Main where

import Parsing.Bench.UU1.HTTP
import Parsing.Bench.UU1.Base

main = do
  inp <- readFile "data/http/bench.http"
  print $ succeeded $ run inp

