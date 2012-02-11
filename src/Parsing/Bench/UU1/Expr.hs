{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU1.Expr where

import Parsing.Bench.AST.Expr
import Parsing.Bench.UU1.Base
import UU.Parsing hiding (Parser)
import qualified UU.Parsing.Interface
import UU.Parsing.CharParser

e1 , e2 , e3 :: Parser Expr
e1 = pChainl op1 e2 <* pSpaces
e2 = pChainl op2 e3 <* pSpaces
e3 = (pParens e1 <|> Var <$> pIdent <|> Nat <$> pNatural <|> pLet) <* pSpaces

op1 , op2 :: Parser (Expr -> Expr -> Expr)
op1 = (Add <$ pSym '+' <|> Sub <$ pSym '-') <* pSpaces
op2 = Mul <$ pSym '*' <* pSpaces

-- pIdent :: Parser String
-- pIdent = pString

pLet :: Parser Expr
pLet = Let <$ pToks "let" <* pSpaces <*> pIdent <* pSpaces <* pSym '=' <* pSpaces <*> e1 <* pToks "in" <* pSpaces <*> e1


pExpr = e1