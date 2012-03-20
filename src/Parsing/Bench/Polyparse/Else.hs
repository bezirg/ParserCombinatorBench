{-# LANGUAGE FlexibleContexts #-}

module Parsing.Bench.Polyparse.Else where

import Parsing.Bench.Polyparse.Base
import Text.Parse

-- the AST
data Expr = TrueExpr
          | FalseExpr
          | IfThen Expr Expr
          | IfThenElse Expr Expr Expr
            deriving (Eq, Show)

run = run' (pExpr <* eof)

pExpr = pBool <|> pIfThenElse

-- pExpr :: Parser Expr
-- pExpr = pBool <|> (\ x -> if length x > 1 then head (tail x)
--                          else head x) <$> amb pIfThenElse


pBool = TrueExpr <$ string "true" <* pSpaces <|> FalseExpr <$ string "false" <* pSpaces

pIfThenElse = IfThenElse <$ string "if" <* pSpaces <*> pExpr <* string "then" <* pSpaces <*> pExpr <* string "else" <* pSpaces <*> pExpr <|>
              IfThen <$ string "if" <* pSpaces <*> pExpr <* string "then" <* pSpaces <*> pExpr
              


inp1 = "if true then true"
inp2 = "if true then if true then true"
inp3 = "if if true then true then true"
inp4 = "if true then true else false"
inp5 = "if true then if true then false else false"
