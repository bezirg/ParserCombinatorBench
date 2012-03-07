module Main where

import Parsing.Bench.Parsec2.CSS

main = do
  inp <- readFile "data/css/bench.css"
  print $ run inp

