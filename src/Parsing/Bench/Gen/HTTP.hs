module Parsing.Bench.Gen.HTTP where

import System.IO
import Data.List

main = do
  f <- openFile "post.http" WriteMode

  keys <- readFile "keys_http.txt"
  values <- readFile "values_http.txt"

  hPutStrLn f "POST http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.6.1  HTTP/1.1"

  hPutStr f $ unlines $ take 10000 $ zipWith (\ k v -> (k ++ ": "++ v)) (lines keys) (lines values)

  hPutStr f "\n"

  hPutStr f =<< readFile "lorem_ipsum.txt"


  hClose f
