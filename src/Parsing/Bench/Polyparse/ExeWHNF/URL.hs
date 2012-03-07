module Main where

import Parsing.Bench.Polyparse.URL
import Parsing.Bench.Polyparse.Base

main = do
  inp <- readFile "data/url/bench.url"
  print $ succeeded $ run inp

