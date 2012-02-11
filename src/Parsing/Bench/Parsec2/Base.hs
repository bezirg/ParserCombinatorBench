module Parsing.Bench.Parsec2.Base 
    (
      module Control.Applicative,
      module Text.ParserCombinators.Parsec,
      pParens,
      pIdent,
      pNatural,
      pExact,
      pCount,
      strip,
      run
    ) where

import Control.Monad
import Data.Char (isSpace)
import Control.Applicative

-- Hide a few names that are provided by Applicative.
import Text.ParserCombinators.Parsec hiding (many, optional, (<|>))

-- The Applicative instance for every Monad looks like this.
instance Applicative (GenParser s a) where
    pure  = return
    (<*>) = ap

-- The Alternative instance for every MonadPlus looks like this.
instance Alternative (GenParser s a) where
    empty = mzero
    (<|>) = mplus


pParens p  = between (char '(') (char ')') p

pIdent :: Parser String
pIdent = liftM2 (:) letter $ many alphaNum

pNatural :: Parser Int
pNatural = liftM read $ many digit 

pExact = count

pCount p = pCount' 0 where
    pCount' i = option i $ p >> pCount' (i+1)

-- if using Data.Text, this function is provided
-- and is more efficient
strip      :: String -> String
strip      = f . f
    where f = reverse . dropWhile isSpace


run = flip parse ""


