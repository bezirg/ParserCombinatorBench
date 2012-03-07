module Main where

import Parsing.Bench.Parsec2.URL
import Parsing.Bench.Parsec2.Base

main = do
  inp <- readFile "data/url/bench.url"
  print $ succeeded $ run inp

