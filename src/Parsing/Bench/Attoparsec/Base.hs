module Parsing.Bench.Attoparsec.Base where

import Data.Attoparsec.Text
import Control.Applicative
import qualified Data.Text as T
import Data.Char (isHexDigit)
import Control.Monad (liftM)

endBy p sep = many (do{ x <- p; sep; return x })

pParens p = char '(' *> p <* char ')'

pChainl pe po  =  h <$> pe <*> many (j <$> po <*> pe)
    where j op x  =  (`op` x)
          h x fs  =  foldl (flip ($)) x fs

pIdent :: Parser String
pIdent = (:) <$> letter <*> many (letter <|> digit)


pExact :: Int -> Parser a -> Parser [a]
pExact = count

hexDigit :: Parser Char
hexDigit = satisfy isHexDigit <?> "hexadecimal digit"

pCount p = pCount' 0 where
     pCount' i = option i $ p >> pCount' (i+1)

oneOf cs = satisfy (inClass cs)

noneOf cs = satisfy (notInClass cs)

spaces = skipSpace

between o c p = o *> p <* c 

optionMaybe p = option Nothing (liftM Just p)

newline = char '\n'

succeeded (Done _ _) = True
succeeded _ = error "Parsing Failed"


run' :: Parser a -> T.Text -> Result a
run' p s = case parse p s of
             Partial f -> f (T.empty)
             x -> x
