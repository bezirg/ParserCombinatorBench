module Parsing.Bench.AST.Expr where

-- import Test.QuickCheck.Arbitrary
-- import Test.QuickCheck.Gen

import Control.Monad
import Control.DeepSeq

-- the Abstract Syntax

data Expr = Add Expr Expr
          | Sub Expr Expr
          | Mul Expr Expr
          | Nat Int
          | Var String
          | Let String Expr Expr
            deriving (Eq, Show)

instance NFData Expr where
    rnf (Add e1 e2) = rnf e1 `seq` rnf e2
    rnf (Sub e1 e2) = rnf e1 `seq` rnf e2
    rnf (Mul e1 e2) = rnf e1 `seq` rnf e2
    rnf (Nat e) = rnf e
    rnf (Var e) = rnf e
    rnf (Let e1 e2 e3) = rnf e1 `seq` rnf e2 `seq` rnf e3


-- instance Show Expr where
--     show (Add e1 e2) = "(" ++ show e1 ++ " + " ++ show e2 ++ ")"
--     show (Sub e1 e2) = "(" ++ show e1 ++ " - " ++ show e2 ++ ")"
--     show (Mul e1 e2) = "(" ++ show e1 ++ " * " ++ show e2 ++ ")"
--     show (Nat x) = show x
--     show (Var s) = s
--     show (Let x e1 e2) = "let " ++ x ++ " = " ++ show e1 ++  " in " ++ show e2

-- instance Arbitrary Expr where
--     arbitrary = sized arbitraryExpr 


-- arbitraryId = listOf1 (choose ('a','z'))
-- arbitraryN = liftM abs arbitrary

-- arbitraryExpr 0 = oneof [liftM Nat arbitraryN, liftM Var arbitraryId]
-- arbitraryExpr n = frequency [(1, liftM Nat arbitraryN),
--                              (1, liftM Var arbitraryId),
--                              (3, liftM3 Let arbitraryId arbitraryE arbitraryE),
--                              (3, liftM2 Add arbitraryE arbitraryE),
--                              (3, liftM2 Sub arbitraryE arbitraryE),
--                              (3, liftM2 Mul arbitraryE arbitraryE)
--                           ]
--                   where 
--                     arbitraryE = arbitraryExpr (n-1)

-- genExprs = sample' (arbitrary :: Gen Expr)

