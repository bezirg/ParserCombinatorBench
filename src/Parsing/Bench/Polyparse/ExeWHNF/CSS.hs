module Main where

import Parsing.Bench.Polyparse.CSS
import Parsing.Bench.Polyparse.Base

main = do
  inp <- readFile "data/css/bench.css"
  print $ succeeded $ run inp

