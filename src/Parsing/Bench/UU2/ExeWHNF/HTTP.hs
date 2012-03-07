module Main where

import Parsing.Bench.UU2.HTTP
import Parsing.Bench.UU2.Base

main = do
  inp <- readFile "data/http/bench.http"
  print $ succeeded $ run inp

