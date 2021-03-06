{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU2.Expr where

import Parsing.Bench.AST.Expr
import Parsing.Bench.UU2.Base
import Text.ParserCombinators.UU
import Text.ParserCombinators.UU.Derived
import Text.ParserCombinators.UU.BasicInstances
import Text.ParserCombinators.UU.Utils

e1 , e2 , e3 :: Parser Expr
e1 = pChainl op1 e2 <* spaces
e2 = pChainl op2 e3 <* spaces
e3 = (pParens e1 <|> Var <$> pIdent <|> Nat <$> pNatural <|> pLet) <* spaces

op1 , op2 :: Parser (Expr -> Expr -> Expr)
op1 = (Add <$ pSym '+' <|> Sub <$ pSym '-') <* spaces
op2 = Mul <$ pSym '*' <* spaces

pLet :: Parser Expr
pLet = Let <$ pToken "let" <* spaces <*> pIdent <* spaces <* pSym '=' <* spaces <*> e1 <* pToken "in" <* spaces <*> e1


pExpr :: Parser Expr
pExpr = spaces *> e1 <* pEnd

run = run' pExpr