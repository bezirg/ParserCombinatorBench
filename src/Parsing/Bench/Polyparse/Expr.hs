module Parsing.Bench.Polyparse.Expr where


import Parsing.Bench.AST.Expr
import Parsing.Bench.Polyparse.Base
import Text.Parse

e1 , e2 , e3 :: TextParser Expr
e1 = pChainl e2 op1 <* pSpaces
e2 = pChainl e3 op2 <* pSpaces
e3 = (pParens e1 <|> pLet <|> Var <$> pIdent <|> Nat <$> parseDec) <* pSpaces

op1 , op2 :: TextParser (Expr -> Expr -> Expr)
op1 = (Add <$ pSym '+' <|> Sub <$ pSym '-') <* pSpaces
op2 = Mul <$ pSym '*' <* pSpaces

pLet :: TextParser Expr
pLet = Let <$ string "let" <* pSpaces <*> pIdent <* pSpaces <* pSym '=' <* pSpaces <*> e1 <* string "in" <* pSpaces <*> e1

pExpr :: TextParser Expr
pExpr = pSpaces *> e1 <* eof

run = run' pExpr