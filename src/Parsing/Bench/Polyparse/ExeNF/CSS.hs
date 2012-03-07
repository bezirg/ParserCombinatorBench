module Main where

import Parsing.Bench.Polyparse.CSS

main = do
  inp <- readFile "data/css/bench.css"
  print $ run inp

