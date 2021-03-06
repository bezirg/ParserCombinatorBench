{-# LANGUAGE OverloadedStrings #-}

module Parsing.Bench.Attoparsec.HTTP where

import Parsing.Bench.AST.HTTP
import Parsing.Bench.Attoparsec.Base

import Data.Attoparsec.Text
import Control.Applicative
import qualified Data.Text as T

import Control.Monad (liftM4)

pHTTP :: Parser HttpRequest
pHTTP = q "GET" Get (pure Nothing)
        <|> q "POST" Post (Just <$> many anyChar)
  where q name ctor body = liftM4 HttpRequest req url p_headers body
            where req = ctor <$ string name <* char ' '
        url = optional (char '/') *>
              manyTill notEOL (try $ string " HTTP/1." <* oneOf "01")
              <* crlf

p_headers :: Parser [(String, String)]
p_headers = header `manyTill` crlf
  where header = liftA2 (,) fieldName (char ':' *> spaces *> contents)
        contents = liftA2 (++) (many1 notEOL <* crlf)
                               (continuation <|> pure [])
        continuation = liftA2 (:) (' ' <$ many1 (oneOf " \t")) contents
        fieldName = (:) <$> letter <*> many fieldChar
        fieldChar = letter <|> digit <|> oneOf "-_"

crlf :: Parser ()
crlf = (() <$ string "\r\n") <|> (() <$ newline)

notEOL :: Parser Char
notEOL = noneOf "\r\n"

run = run' pHTTP