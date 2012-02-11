module Parsing.Bench.Gen.URL where

import System.IO
import Data.List

main = do
  f <- openFile "gen10000.url" WriteMode

  keys <- readFile "keys_http.txt"
  values <- readFile "values_http.txt"

  hPutStr f $ concat $ take 10000 $ zipWith (\ k v -> 
                                              (if length k `mod` 3 == 0
                                               then k
                                               else k ++ "="++ v)
                                              ++ "&")
              (lines keys) (lines values)

  hClose f
