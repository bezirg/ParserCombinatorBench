module Main where

import Parsing.Bench.UU2.URL
import Parsing.Bench.UU2.Base

main = do
  inp <- readFile "data/url/bench.url"
  print $ succeeded $ run inp

