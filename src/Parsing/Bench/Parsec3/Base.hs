module Parsing.Bench.Parsec3.Base where

import Text.Parsec
import Control.Monad
import Text.Parsec.String (Parser)
import Control.Monad
import Data.Functor.Identity (Identity)
import Data.Char (isSpace)

pParens p  = between (char '(') (char ')') p

pIdent :: Parser String
pIdent = liftM2 (:) letter $ many alphaNum

pNatural :: Parser Int
pNatural = liftM read $ many digit 

pExact :: Int -> Parser a -> Parser [a]
pExact = count

pCount p = pCount' 0 where
    pCount' i = option i $ p >> pCount' (i+1)

-- if using Data.Text, this function is provided
-- and is more efficient
strip      :: String -> String
strip      = f . f
    where f = reverse . dropWhile isSpace

succeeded (Right _) = True
succeeded _ = error "Parsing Failed"


run' :: Parser a -> String -> Either ParseError a
run' = flip parse ""

