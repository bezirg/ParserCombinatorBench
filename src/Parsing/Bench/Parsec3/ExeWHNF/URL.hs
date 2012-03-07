module Main where

import Parsing.Bench.Parsec3.URL
import Parsing.Bench.Parsec3.Base

main = do
  inp <- readFile "data/url/bench.url"
  print $ succeeded $ run inp

