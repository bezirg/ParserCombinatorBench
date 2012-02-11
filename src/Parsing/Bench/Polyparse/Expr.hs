module Parsing.Bench.Polyparse.Expr where


import Parsing.Bench.AST.Expr
import Parsing.Bench.Polyparse.Base
import Text.Parse

e1 , e2 , e3 :: TextParser Expr
e1 = pChainl e2 op1 <* spaces
e2 = pChainl e3 op2 <* spaces
e3 = (pParens e1 <|> pLet <|> Var <$> pIdent <|> Nat <$> parseDec) <* spaces

op1 , op2 :: TextParser (Expr -> Expr -> Expr)
op1 = (Add <$ pSym '+' <|> Sub <$ pSym '-') <* spaces
op2 = Mul <$ pSym '*' <* spaces

pLet :: TextParser Expr
pLet = Let <$ string "let" <* spaces <*> pIdent <* spaces <* pSym '=' <* spaces <*> e1 <* string "in" <* spaces <*> e1

pExpr :: TextParser Expr
pExpr = spaces *> e1 <* eof

run = run' pExpr