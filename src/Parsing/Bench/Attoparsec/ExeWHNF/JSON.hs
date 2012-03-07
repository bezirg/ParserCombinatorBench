module Main where

import Parsing.Bench.Attoparsec.JSON
import Parsing.Bench.Attoparsec.Base

import qualified Data.Text.IO as TIO

main = do
  inp <- TIO.readFile "data/json/bench.json"
  print $ succeeded $ run inp

