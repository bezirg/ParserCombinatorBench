module Main where

import Parsing.Bench.Polyparse.URL

main = do
  inp <- readFile "data/url/bench.url"
  print $ run inp

