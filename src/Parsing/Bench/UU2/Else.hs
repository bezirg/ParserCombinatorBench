{-# LANGUAGE FlexibleContexts #-}

module Parsing.Bench.UU2.Else where

import Parsing.Bench.UU2.Base
import Text.ParserCombinators.UU
import Text.ParserCombinators.UU.Derived
import Text.ParserCombinators.UU.Utils
import Text.ParserCombinators.UU.BasicInstances
import Debug.Trace

-- the AST
data Expr = TrueExpr
          | FalseExpr
          | IfThen Expr Expr
          | IfThenElse Expr Expr Expr
            deriving (Eq, Show)

run = run' pExpr

pExpr :: Parser Expr
pExpr = pBool <|> pIfThenElse

-- pExpr :: Parser Expr
-- pExpr = pBool <|> (\ x -> if length x > 1 then head (tail x)
--                          else head x) <$> amb pIfThenElse


pBool :: Parser Expr
pBool = TrueExpr <$ pToken "true" <* pSpaces <|> FalseExpr <$ pToken "false" <* pSpaces

pIfThenElse :: Parser Expr
pIfThenElse = IfThen <$ pToken "if" <* pSpaces <*> pExpr <* pToken "then" <* pSpaces <*> pExpr <|>
              IfThenElse <$ pToken "if" <* pSpaces <*> pExpr <* pToken "then" <* pSpaces <*> pExpr <* pToken "else" <* pSpaces <*> pExpr





inp1 = "if true then true"
inp2 = "if true then if true then true"
inp3 = "if if true then true then true"
inp4 = "if true then true else false"
inp5 = "if true then if true then false else false"
