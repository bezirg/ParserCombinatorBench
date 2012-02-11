module Parsing.Bench.Parsec3.Expr where

import Parsing.Bench.AST.Expr
import Parsing.Bench.Parsec3.Base
import Text.Parsec hiding ((<|>), many)
import Text.Parsec.String (Parser)
import Control.Monad
import Data.Functor.Identity (Identity)

import Control.Applicative

e1 , e2 , e3 :: Parser Expr
e1 = chainl1 e2 op1 <* spaces
e2 = chainl1 e3 op2 <* spaces
e3 = (pParens e1 <|> try pLet <|> liftM Var pIdent <|> liftM Nat pNatural) <* spaces

op1 , op2 :: Parser (Expr -> Expr -> Expr)
op1 = ((char '+' >> return Add) <|> (char '-' >> return Sub)) <* spaces
op2 = (char '*' >> return Mul) <* spaces

pLet :: Parser Expr
pLet = do
  string "let"
  spaces
  id <- pIdent
  spaces
  char '='
  spaces
  ex_id <- e1 
  string "in" 
  spaces
  ex_in <- e1
  return $ Let id ex_id ex_in

pExpr :: Parser Expr
pExpr = spaces *> e1 <* eof