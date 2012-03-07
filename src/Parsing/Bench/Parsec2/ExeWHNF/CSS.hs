module Main where

import Parsing.Bench.Parsec2.CSS
import Parsing.Bench.Parsec2.Base

main = do
  inp <- readFile "data/css/bench.css"
  print $ succeeded $ run inp

