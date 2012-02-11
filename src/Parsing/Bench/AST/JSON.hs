module Parsing.Bench.AST.JSON where

data JValue = JString String
            | JNumber Double
            | JObject (JObj JValue)
            | JArray (JAry JValue)
            | JBool Bool
            | JNull
              deriving Show

newtype JAry a = JAry {fromJary :: [a]}
    deriving Show
newtype JObj a = JObj { fromJObj :: [(String, a)]}
    deriving Show
