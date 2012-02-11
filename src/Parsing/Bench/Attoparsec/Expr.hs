module Parsing.Bench.Attoparsec.Expr where

import Parsing.Bench.AST.Expr
import Parsing.Bench.Attoparsec.Base

import Data.Attoparsec.Text
import Control.Applicative
import qualified Data.Text as T

e1 , e2 , e3 :: Parser Expr
e1 = pChainl e2 op1 <* skipSpace
e2 = pChainl e3 op2 <* skipSpace
e3 = (pParens e1 <|>  pLet <|> Var <$> pIdent <|> Nat <$> decimal) <* skipSpace

op1 , op2 :: Parser (Expr -> Expr -> Expr)
op1 = (Add <$ char '+' <|> Sub <$ char '-') <* skipSpace
op2 = Mul <$ char '*' <* skipSpace


pLet :: Parser Expr
pLet = Let <$ string (T.pack "let") <* skipSpace <*> pIdent <* skipSpace <* char '=' <* skipSpace <*> e1 <* string (T.pack "in") <* skipSpace <*> e1

pExpr :: Parser Expr
pExpr = skipSpace *> e1 <* endOfInput