module Parsing.Bench.Polyparse.Base where

import Text.Parse
import Data.Char
import Control.Monad (liftM)
import Data.Char (isSpace)

p <?> msg = p <|> fail msg

pParens p = pSym '(' *> p <* pSym ')'

endBy p sep = many (do{ x <- p; sep; return x })

noneOf cs = satisfy (`notElem` cs)

pAnySym cs = satisfy (`elem` cs)

pSym s = satisfy (== s)

pLower = satisfy isLower

pUpper = satisfy isUpper

pLetter = satisfy isAlpha

pDigit = satisfy isDigit

pChainl pe po  =  h <$> pe <*> many (j <$> po <*> pe)
    where j op x  =  (`op` x)
          h x fs  =  foldl (flip ($)) x fs
string [] = pure []
string (x:xs) = (:) <$> pSym x <*> string xs

pIdent :: TextParser String
pIdent = (:) <$> pLetter <*> many (pLetter <|> pDigit)


pCount p = pCount' 0 where
    pCount' i = option i $ p >> pCount' (i+1)

option x y = y `onFail` return x


hexDigit :: TextParser Char
hexDigit = satisfy isHexDigit <?> "hexadecimal digit"

optionMaybe p = option Nothing (liftM Just p)

between o c p = o *> p <* c 

pSpaces :: TextParser String
pSpaces = many (pAnySym " \r\n\t")

spaces :: TextParser ()
spaces = () <$ many (pAnySym " \r\n\t") 

newline = pSym '\n'

anyChar = satisfy (const True)

-- if using Data.Text, this function is provided
-- and is more efficient
strip      :: String -> String
strip      = f . f
    where f = reverse . dropWhile isSpace

space = satisfy isSpace

skipMany p = many p *> pure ()

skipMany1 p = p *> skipMany1 p

run' = runParser

