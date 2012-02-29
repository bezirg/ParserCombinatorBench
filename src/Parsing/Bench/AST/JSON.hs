{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Parsing.Bench.AST.JSON where

import Control.DeepSeq

data JValue = JString String
            | JNumber Double
            | JObject (JObj JValue)
            | JArray (JAry JValue)
            | JBool Bool
            | JNull
              deriving (Eq, Show)

instance NFData JValue where
    rnf (JString e) = rnf e
    rnf (JNumber e) = rnf e
    rnf (JObject e) = rnf e
    rnf (JBool e) = rnf e
    rnf j = j `seq` ()

newtype JAry a = JAry {fromJary :: [a]}
    deriving (Eq, Show, NFData)
newtype JObj a = JObj { fromJObj :: [(String, a)]}
    deriving (Eq, Show, NFData)
