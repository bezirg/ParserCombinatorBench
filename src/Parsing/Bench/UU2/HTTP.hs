{-# LANGUAGE FlexibleContexts #-}
module Parsing.Bench.UU2.HTTP where

import Parsing.Bench.AST.HTTP
import Parsing.Bench.UU2.Base
import Text.ParserCombinators.UU
import Text.ParserCombinators.UU.Utils
import Text.ParserCombinators.UU.BasicInstances

import Numeric (readHex)
import System.IO (Handle)

pHTTP :: Parser HttpRequest
pHTTP = q "GET" Get (pure Nothing)
        <|> q "POST" Post (Just <$> pList anyChar)
  where q name ctor body = HttpRequest <$> req <*> url <*> p_headers <*> body
            where req = ctor <$ pToken name <* pSym ' '
        url = optional (pSym '/') *>
              pManyTill notEOL (pToken " HTTP/1." <* pAnySym "01")
              <* crlf

p_headers :: Parser [(String, String)]
p_headers = header `pManyTill` crlf
  where header = (,) <$> fieldName <* pSym ':' <* spaces <*> contents
        contents = (++) <$> 
                   (pList1 notEOL <* crlf) <*>
                   (continuation <|> pure [])
        continuation = (:) <$> 
                       (' ' <$ pList1 (pAnySym " \t")) <*>
                       contents
        fieldName = (:) <$> pLetter <*> pList fieldChar
        fieldChar = pLetter <|> pDigit <|> pAnySym "-_"

crlf :: Parser ()
crlf = () <$ optional pCR <* pLF

notEOL :: Parser Char
notEOL = pNoneSym "\r\n"
