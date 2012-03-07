module Main where

import Parsing.Bench.Attoparsec.CSS
import Parsing.Bench.Attoparsec.Base

import qualified Data.Text.IO as TIO

main = do
  inp <- TIO.readFile "data/css/bench.css"
  print $ succeeded $ run inp

