module Parsing.Bench.UU1.HTTP where

import Parsing.Bench.AST.HTTP
import Parsing.Bench.UU1.Base
import UU.Parsing hiding (Parser)
import qualified UU.Parsing.Interface
import UU.Parsing.CharParser

pHTTP :: Parser HttpRequest
pHTTP = q "GET" Get (pSucceed Nothing)
        <|> q "POST" Post (Just <$> pList anyChar)
  where q name ctor body = HttpRequest <$> req <*> url <*> p_headers <*> body
            where req = ctor <$ pToks name <* pSym ' '
        url = optional (pSym '/') *>
              -- removed the try construct
              pManyTill notEOL (pToks " HTTP/1." <* pAnySym "01")
              <* crlf

p_headers :: Parser [(String, String)]
p_headers = header `pManyTill` crlf
  where header = fieldName <+> (pSym ':' *> spaces *> contents)
        contents = (++) <$> 
                   (pList1 notEOL <* crlf) <*>
                   (continuation <|> pSucceed [])
        continuation = (:) <$> 
                       (' ' <$ pList1 (pAnySym " \t")) <*>
                       contents
        fieldName = (:) <$> pLetter <*> pList fieldChar
        fieldChar = pLetter <|> pDigit <|> pAnySym "-_"

crlf :: Parser ()
crlf = () <$ optional pCR <* pLF

notEOL :: Parser Char
notEOL = pNoneSym "\r\n"


run = run' pHTTP