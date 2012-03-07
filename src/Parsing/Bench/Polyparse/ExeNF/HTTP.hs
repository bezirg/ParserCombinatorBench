module Main where

import Parsing.Bench.Polyparse.HTTP

main = do
  inp <- readFile "data/http/bench.http"
  print $ run inp

