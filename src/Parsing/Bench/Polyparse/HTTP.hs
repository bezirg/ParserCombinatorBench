module Parsing.Bench.Polyparse.HTTP where

import Parsing.Bench.AST.HTTP
import Parsing.Bench.Polyparse.Base
import Text.Parse

import Numeric (readHex)
import Control.Monad (liftM4)
import System.IO (Handle)


pHTTP :: TextParser HttpRequest
pHTTP = q "GET" Get (pure Nothing)
        <|> q "POST" Post (Just <$> many anyChar)
  where q name ctor body = liftM4 HttpRequest req url p_headers body
            where req = ctor <$ string name <* pSym ' '
        url = optional (pSym '/') *>
              notEOL `manyFinally'` (string " HTTP/1." <* pAnySym "01")
              <* crlf


p_headers :: TextParser [(String, String)]
p_headers = header `manyFinally` crlf
  where header = liftA2 (,) fieldName (pSym ':' *> spaces *> contents)
        contents = liftA2 (++) (many1 notEOL <* crlf)
                               (continuation <|> pure [])
        continuation = liftA2 (:) (' ' <$ many1 (pAnySym " \t")) contents
        fieldName = (:) <$> pLetter <*> many fieldChar
        fieldChar = pLetter <|> pDigit <|> pAnySym "-_"

crlf :: TextParser ()
crlf = (() <$ string "\r\n") <|> (() <$ newline)

notEOL :: TextParser Char
notEOL = noneOf "\r\n"

run = run' pHTTP