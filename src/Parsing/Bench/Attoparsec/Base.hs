module Parsing.Bench.Attoparsec.Base where

import Data.Attoparsec.Text
import Control.Applicative
import qualified Data.Text as T
import Data.Char (isHexDigit)
import Control.Monad (liftM)

endBy p sep = many (do{ x <- p; sep; return x })

noneOf cs = satisfy (\c -> not (elem c cs))

pParens p = char '(' *> p <* char ')'

pChainl pe po  =  h <$> pe <*> many (j <$> po <*> pe)
    where j op x  =  (`op` x)
          h x fs  =  foldl (flip ($)) x fs

-- chainl p op x       = chainl1 p op <|> return x

-- chainl1 p op        = do{ x <- p; rest x }
--                     where
--                       rest x    = do{ f <- op
--                                     ; y <- p
--                                     ; rest (f x y)
--                                     }
--                                 <|> return x


pIdent :: Parser String
pIdent = (:) <$> letter <*> many (letter <|> digit)


pExact :: Int -> Parser a -> Parser [a]
pExact = count

hexDigit :: Parser Char
hexDigit = satisfy isHexDigit <?> "hexadecimal digit"

pCount p = pCount' 0 where
     pCount' i = option i $ p >> pCount' (i+1)

oneOf cs = satisfy (inClass cs)

spaces = skipSpace

between o c p = o *> p <* c 

optionMaybe p = option Nothing (liftM Just p)

newline = char '\n'

run :: Parser a -> String -> Result a
run p s = case parse p (T.pack s) of
            Partial f -> f (T.empty)
            x -> x
