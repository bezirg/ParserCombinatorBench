module Main where

import Parsing.Bench.UU2.HTTP

main = do
  inp <- readFile "data/http/bench.http"
  print $ run inp

