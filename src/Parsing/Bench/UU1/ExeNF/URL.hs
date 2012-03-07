module Main where

import Parsing.Bench.UU1.URL

main = do
  inp <- readFile "data/url/bench.url"
  print $ run inp

