-- Taken from package css-text

module Parsing.Bench.Parsec2.CSS where

import Parsing.Bench.Parsec2.Base

skipWS :: CharParser () ()
skipWS = (string "/*" >> endComment >> skipWS)
     <|> (skipMany1 space >> skipWS)
     <|> return ()
  where
    endComment = do
        skipMany (satisfy  (/= '*'))
        (do
            _ <- char '*'
            (char '/' >> return ()) <|> endComment
            ) <|> fail "Missing end comment"

attrParser :: CharParser () (String, String)
attrParser = do
    skipWS
    key <- many1 (noneOf ":{}")
    _ <- char ':' <|> fail "Missing colon in attribute"
    value <- (many (noneOf ";}"))
    return (strip key, strip value)

attrsParser :: CharParser () [(String, String)]
attrsParser =
    go id
  where
    go front = (do
        a <- attrParser
        (char ';' >> return ()) <|> return ()
        skipWS
        go $ front . (:) a
        ) <|> return (front [])

blockParser :: CharParser () (String, [(String, String)])
blockParser = do
    skipWS
    sel <- many (noneOf "{")
    _ <- char '{'
    attrs <- attrsParser
    skipWS
    _ <- char '}'
    return (strip sel, attrs)

blocksParser :: CharParser () [(String, [(String, String)])]
blocksParser = many blockParser

pCSS = spaces *> blocksParser <* eof