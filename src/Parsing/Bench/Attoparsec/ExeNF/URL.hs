module Main where

import Parsing.Bench.Attoparsec.URL
import qualified Data.Text.IO as TIO

main = do
  inp <- TIO.readFile "data/url/bench.url"
  print $ run inp

