module Main where

import Parsing.Bench.UU1.HTTP

main = do
  inp <- readFile "data/http/bench.http"
  print $ run inp

