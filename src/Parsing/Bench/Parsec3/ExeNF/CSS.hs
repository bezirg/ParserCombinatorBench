module Main where

import Parsing.Bench.Parsec3.CSS

main = do
  inp <- readFile "data/css/bench.css"
  print $ run inp

