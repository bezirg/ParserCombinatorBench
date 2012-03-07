module Main where

import Parsing.Bench.UU2.URL

main = do
  inp <- readFile "data/url/bench.url"
  print $ run inp

