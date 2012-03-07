module Main where

import Parsing.Bench.Parsec2.URL

main = do
  inp <- readFile "data/url/bench.url"
  print $ run inp

