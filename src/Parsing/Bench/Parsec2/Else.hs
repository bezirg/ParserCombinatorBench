{-# LANGUAGE FlexibleContexts #-}

module Parsing.Bench.Parsec2.Else where

import Parsing.Bench.Parsec2.Base

-- the AST
data Expr = TrueExpr
          | FalseExpr
          | IfThen Expr Expr
          | IfThenElse Expr Expr Expr
            deriving (Eq, Show)

run = run' (pExpr <* eof)

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
pIfThenElse = try (IfThenElse <$ string "if" <* spaces <*> pExpr <* string "then" <* spaces <*> pExpr <* string "else" <* spaces <*> pExpr) <|>
              IfThen <$ string "if" <* spaces <*> pExpr <* string "then" <* spaces <*> pExpr 

inp1 = "if true then true"
inp2 = "if true then if true then true"
inp3 = "if if true then true then true"
inp4 = "if true then true else false"
inp5 = "if true then if true then false else false"
