module Main where

import Parsing.Bench.Attoparsec.CSV
import Parsing.Bench.Attoparsec.Base

import qualified Data.Text.IO as TIO

main = do
  inp <- TIO.readFile "data/csv/bench.csv"
  print $ succeeded $ run inp

