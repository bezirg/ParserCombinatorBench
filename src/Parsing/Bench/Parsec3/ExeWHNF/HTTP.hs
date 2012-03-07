module Main where

import Parsing.Bench.Parsec3.HTTP
import Parsing.Bench.Parsec3.Base

main = do
  inp <- readFile "data/http/bench.http"
  print $ succeeded $ run inp

