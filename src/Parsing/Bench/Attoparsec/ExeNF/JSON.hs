module Main where

import Parsing.Bench.Attoparsec.JSON
import qualified Data.Text.IO as TIO

main = do
  inp <- TIO.readFile "data/json/bench.json"
  print $ run inp

