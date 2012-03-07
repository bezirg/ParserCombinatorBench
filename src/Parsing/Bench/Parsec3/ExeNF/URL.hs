module Main where

import Parsing.Bench.Parsec3.URL

main = do
  inp <- readFile "data/url/bench.url"
  print $ run inp

