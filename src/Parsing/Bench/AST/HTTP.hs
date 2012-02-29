module Parsing.Bench.AST.HTTP where

import Control.DeepSeq

data Method = Get | Post
          deriving (Eq, Ord, Show)

data HttpRequest = HttpRequest {
      reqMethod :: Method
    , reqURL :: String
    , reqHeaders :: [(String, String)]
    , reqBody :: Maybe String
    } deriving (Eq, Show)


instance NFData Method

instance NFData HttpRequest where
    rnf (HttpRequest e1 e2 e3 e4) = rnf e1 `seq` rnf e2 `seq` rnf e3 `seq` rnf e4