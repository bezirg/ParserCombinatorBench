-- Taken from package css-text

module Parsing.Bench.Polyparse.CSS where

import Parsing.Bench.Polyparse.Base
import Text.Parse


skipWS :: TextParser ()
skipWS = spaces *> optional (string "/*" *> anyChar `manyFinally'` string "*/") *> spaces

attrParser :: TextParser (String, String)
attrParser = do
    skipWS
    key <- many1 (noneOf ":{}")
    pSym ':' <?> "Missing colon in attribute"
    value <- (many (noneOf ";}"))
    return (strip key, strip value)

attrsParser :: TextParser [(String, String)]
attrsParser =
    go id
  where
    go front = (do
        a <- attrParser
        (pSym ';' >> return ()) <|> return ()
        skipWS
        go $ front . (:) a
        ) <|> return (front [])

blockParser :: TextParser (String, [(String, String)])
blockParser = do
    skipWS
    sel <- many (noneOf "{")
    pSym '{'
    attrs <- attrsParser
    skipWS
    pSym '}'
    return (strip sel, attrs)

blocksParser :: TextParser [(String, [(String, String)])]
blocksParser = many blockParser

pCSS :: TextParser [(String, [(String, String)])]
pCSS = blocksParser

