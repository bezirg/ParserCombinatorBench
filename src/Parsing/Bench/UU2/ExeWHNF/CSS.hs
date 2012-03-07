module Main where

import Parsing.Bench.UU2.CSS
import Parsing.Bench.UU2.Base

main = do
  inp <- readFile "data/css/bench.css"
  print $ succeeded $ run inp

