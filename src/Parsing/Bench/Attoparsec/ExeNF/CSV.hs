module Main where

import Parsing.Bench.Attoparsec.CSV
import qualified Data.Text.IO as TIO

main = do
  inp <- TIO.readFile "data/csv/bench.csv"
  print $ run inp

