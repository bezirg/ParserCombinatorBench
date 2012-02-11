{-# LANGUAGE OverloadedStrings #-}

-- Taken from package css-text

module Parsing.Bench.Attoparsec.CSS where

import Parsing.Bench.Attoparsec.Base
import Prelude hiding (takeWhile)
import Data.Attoparsec.Text
import Data.Text (Text, strip)
import Control.Applicative ((<|>), many)
import Data.Char (isSpace)

parseAttrs :: Text -> Either String [(Text, Text)]
parseAttrs = parseOnly attrsParser

parseAttr :: Text -> Either String (Text, Text)
parseAttr = parseOnly attrParser

parseBlocks :: Text -> Either String [(Text, [(Text, Text)])]
parseBlocks = parseOnly blocksParser

parseBlock :: Text -> Either String (Text, [(Text, Text)])
parseBlock = parseOnly blockParser

skipWS :: Parser ()
skipWS = (string "/*" >> endComment >> skipWS)
     <|> (skip isSpace >> skipWhile isSpace >> skipWS)
     <|> return ()
  where
    endComment = do
        skipWhile (/= '*')
        (do
            _ <- char '*'
            (char '/' >> return ()) <|> endComment
            ) <|> fail "Missing end comment"

attrParser :: Parser (Text, Text)
attrParser = do
    skipWS
    key <- takeWhile1 (not . flip elem ":{}")
    _ <- char ':' <|> fail "Missing colon in attribute"
    value <- (takeWhile (not . flip elem ";}"))
    return (strip key, strip value)

attrsParser :: Parser [(Text, Text)]
attrsParser =
    go id
  where
    go front = (do
        a <- attrParser
        (char ';' >> return ()) <|> return ()
        skipWS
        go $ front . (:) a
        ) <|> return (front [])

blockParser :: Parser (Text, [(Text, Text)])
blockParser = do
    skipWS
    sel <- takeWhile (/= '{')
    _ <- char '{'
    attrs <- attrsParser
    skipWS
    _ <- char '}'
    return (strip sel, attrs)

blocksParser :: Parser [(Text, [(Text, Text)])]
blocksParser = many blockParser

pCSS :: Parser [(Text, [(Text, Text)])]
pCSS = blocksParser