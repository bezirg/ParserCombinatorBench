module Parsing.Bench.Attoparsec.CSV where

import Parsing.Bench.Attoparsec.Base

import Data.Attoparsec.Text
import Control.Applicative
import qualified Data.Text as T

pCSV = many line
line = sepBy cell (char ',') <* eol
cell = many (noneOf ",\n\r")

eol =   string (T.pack "\n\r") <|> 
        string (T.pack "\r\n") <|>
        string (T.pack "\n") <|> 
        string (T.pack "\r")

run = run' pCSV