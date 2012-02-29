{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU2.Base where

import Text.ParserCombinators.UU
import Text.ParserCombinators.UU.Utils
import Text.ParserCombinators.UU.BasicInstances
import Data.Char (isHexDigit, isSpace)
import Control.Monad (liftM)

pNoSym c = pSatisfy (/= c) (Insertion "" 'a' 5)

pEndSep :: Parser a1 -> Parser a -> Parser [a]
pEndSep sep p = pListSep_ng sep p <* sep

pNoneSym :: [Char] -> Parser Char
pNoneSym cs = pSatisfy (`notElem` cs) (Insertion "" 'a' 5)


pIdent :: Parser String
pIdent = (:) <$> pLetter <*> pMany (pLetter <|> pDigit)

hexDigit :: Parser Char
hexDigit = pSatisfy isHexDigit (Insertion "" 'a' 5) <?> "hexadecimal digit"

optionMaybe p = opt (Just <$> p) Nothing

spaces :: Parser String
spaces =  pMunch (`elem` " \r\n\t")  

-- spaces :: Parser ()
-- spaces = pSpaces *> pure ()

choice [] = mzero
choice (p:ps)  = p <|> choice ps

anyChar :: Parser Char
anyChar = pSatisfy (const True) (Insertion "" 'a' 5)

-- taken from Doaitse's demo
pManyTill :: P st a -> P st b -> P st [a]
pManyTill p end = [] <$ end 
                  <<|> 
                  (:) <$> p <*> pManyTill p end

-- if using Data.Text, this function is provided
-- and is more efficient
strip      :: String -> String
strip      = f . f
    where f = reverse . dropWhile isSpace

space :: Parser Char
space = pSatisfy isSpace (Insertion "" ' ' 5)

skipMany p = many p *> pure ()

skipMany1 p = p *> skipMany1 p

-- the library is Error Correcting by default
-- probably the ErrorCorrection cannot be turned off
-- returns (ResultAfterMaybeErrorCorrectionApplied, Errors)
-- to determine if it was an error, simply check if null Errors
run' :: Parser a -> String -> (a, [Error LineColPos])
run' = execParser

