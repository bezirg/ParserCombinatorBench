{-# LANGUAGE OverloadedStrings #-}

module Parsing.Bench.Attoparsec.CSV where

import Parsing.Bench.Attoparsec.Base

import Data.Attoparsec.Text
import Control.Applicative
import qualified Data.Text as T

pCSV = many line
line = sepBy cell (char ',') <* eol
cell = many (noneOf ",\n\r")

eol =   string "\r\n" <|>   -- MS
        string "\n"   <|>   -- Unix
        string "\r"         -- MacOS

run = run' pCSV