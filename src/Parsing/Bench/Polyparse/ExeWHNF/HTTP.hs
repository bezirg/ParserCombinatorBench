module Main where

import Parsing.Bench.Polyparse.HTTP
import Parsing.Bench.Polyparse.Base

main = do
  inp <- readFile "data/http/bench.http"
  print $ succeeded $ run inp

