module Main where

import Parsing.Bench.UU1.URL
import Parsing.Bench.UU1.Base

main = do
  inp <- readFile "data/url/bench.url"
  print $ succeeded $ run inp

