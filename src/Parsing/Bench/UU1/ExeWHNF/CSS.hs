module Main where

import Parsing.Bench.UU1.CSS
import Parsing.Bench.UU1.Base

main = do
  inp <- readFile "data/css/bench.css"
  print $ succeeded $ run inp

