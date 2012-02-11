module Parsing.Bench.Gen.Expr where

import System.IO
import Data.List
import Parsing.Bench.AST.Expr (genExprs)

main = do
  exprs <- genExprs
  sequence_ [writeFile ("gen" ++ show i ++ ".expr") (show expr) | (expr, i) <- zip exprs [1.. length exprs]]
