module Main where

import Parsing.Bench.Attoparsec.HTTP
import Parsing.Bench.Attoparsec.Base

import qualified Data.Text.IO as TIO

main = do
  inp <- TIO.readFile "data/http/bench.http"
  print $ succeeded $ run inp

