{-# LANGUAGE FlexibleContexts #-}

module Parsing.Bench.UU1.Else where

import Parsing.Bench.UU1.Base
import UU.Parsing hiding (Parser)
import qualified UU.Parsing.Interface
import UU.Parsing.CharParser
import Data.Function (on)

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
pBool = TrueExpr <$ pToks "true" <* pSpaces <|> FalseExpr <$ pToks "false" <* pSpaces

pIfThenElse :: Parser Expr
pIfThenElse = IfThen <$ pToks "if" <* pSpaces <*> pExpr <* pToks "then" <* pSpaces <*> pExpr <|>
              IfThenElse <$ pToks "if" <* pSpaces <*> pExpr <* pToks "then" <* pSpaces <*> pExpr <* pToks "else" <* pSpaces <*> pExpr





inp1 = "if true then true"
inp2 = "if true then if true then true"
inp3 = "if if true then true then true"
inp4 = "if true then true else false"
inp5 = "if true then if true then false else false"
