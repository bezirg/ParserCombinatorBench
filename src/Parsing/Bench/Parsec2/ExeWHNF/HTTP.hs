module Main where

import Parsing.Bench.Parsec2.HTTP
import Parsing.Bench.Parsec2.Base

main = do
  inp <- readFile "data/http/bench.http"
  print $ succeeded $ run inp

