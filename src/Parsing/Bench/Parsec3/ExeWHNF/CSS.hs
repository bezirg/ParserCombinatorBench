module Main where

import Parsing.Bench.Parsec3.CSS
import Parsing.Bench.Parsec3.Base

main = do
  inp <- readFile "data/css/bench.css"
  print $ succeeded $ run inp

