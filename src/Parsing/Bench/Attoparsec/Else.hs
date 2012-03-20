{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts #-}

module Parsing.Bench.Attoparsec.Else where

import Parsing.Bench.Attoparsec.Base
import Control.Applicative
import Data.Attoparsec.Text
import qualified Data.Text as T
    
-- the AST
data Expr = TrueExpr
          | FalseExpr
          | IfThen Expr Expr
          | IfThenElse Expr Expr Expr
            deriving (Eq, Show)

run = run' (pExpr <* endOfInput)

pExpr :: Parser Expr
pExpr = pBool <|> pIfThenElse

-- pExpr :: Parser Expr
-- pExpr = pBool <|> (\ x -> if length x > 1 then head (tail x)
--                          else head x) <$> amb pIfThenElse


pBool :: Parser Expr
pBool = TrueExpr <$ string "true" <* spaces <|> FalseExpr <$ string "false" <* spaces

-- pIfThenElse :: Parser Expr
-- pIfThenElse = IfThenElse <$ string "if" <* spaces <*> pExpr <* string "then" <* spaces <*> pExpr <*> optionMaybe (string "else" *> spaces *> pExpr)


pIfThenElse :: Parser Expr
pIfThenElse = (IfThenElse <$ string "if" <* spaces <*> pExpr <* string "then" <* spaces <*> pExpr <* string "else" <* spaces <*> pExpr) <|>
              IfThen <$ string "if" <* spaces <*> pExpr <* string "then" <* spaces <*> pExpr 


inp1 :: T.Text
inp1 = "if true then true"
inp2 :: T.Text
inp2 = "if true then if true then true"
inp3 :: T.Text
inp3 = "if if true then true then true"
inp4 :: T.Text
inp4 = "if true then true else false"
inp5 :: T.Text
inp5 = "if true then if true then false else false"
