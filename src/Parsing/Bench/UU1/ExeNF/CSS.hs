module Main where

import Parsing.Bench.UU1.CSS

main = do
  inp <- readFile "data/css/bench.css"
  print $ run inp

