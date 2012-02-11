module Parsing.Bench.UU1.Base where

import UU.Parsing hiding (Parser)
import qualified UU.Parsing.Interface
import UU.Parsing.CharParser
import UU.Parsing.Machine
import Data.Char (chr, isSpace)
import Data.Maybe (fromJust)

type Parser a = UU.Parsing.Interface.Parser Char a

allChars = (chr 1, chr 127, ' ')

pNoneSym :: [Char] -> Parser Char
pNoneSym cs = allChars `pExcept` cs

pEndSep :: Parser a1 -> Parser a -> Parser [a]
pEndSep sep p = pListSep_ng sep p <* sep

pParens :: Parser a -> Parser a
pParens  = pPacked (pSym '(') (pSym ')')

pNatural :: Parser Int
pNatural = read <$> pList pDigit

pLetter = pLower <|> pUpper

pLower = pAnySym ['a'..'z']

pUpper = pAnySym ['A'..'Z']

pDigit = pAnySym "0123456789"

pIdent :: Parser String
pIdent = (:) <$> pLetter <*> pList (pLetter <|> pDigit)

hexDigit :: Parser Char
hexDigit = pAnySym "0123456789ABCDEF" <?> "hexadecimal digit"

pExact n p | n == 0 = pSucceed []
           | n >  0 = (:) <$> p <*> pExact (n-1) p


-- i should ask Doaitse
--
choice [p] = p
choice (p:ps)  = p <|> choice ps

optionMaybe p = opt (Just <$> p) Nothing

pSpaces :: Parser String
pSpaces = pList $ pAnySym " \r\n\t" <?> "Whitespace"

spaces :: Parser ()
spaces = pSpaces *> pSucceed ()

pCR :: Parser Char
pCR = pSym '\r'

pLF :: Parser Char
pLF = pSym '\n'

pDouble :: Parser Double
pDouble = lexeme pDoubleRaw

pDoubleRaw :: (Read a) => Parser a
pDoubleRaw = read <$> pDoubleStr

pDoubleStr :: Parser  [Char]
pDoubleStr = pOptSign <*> (pToks "Infinity" <|> pPlainDouble)
             <?> "Double (eg -3.4e-5)"
  where
    pPlainDouble = (++) <$> ((++) <$> pList1 pDigit <*> (pFraction `opt` [])) <*> pExponent
    pFraction = (:) <$> pSym '.' <*> pList1 pDigit
    pExponent = ((:) <$> pAnySym "eE" <*> (pOptSign <*> pList1 pDigit)) `opt` []
    pOptSign = ((('+':) <$ (pSym '+')) <|> (('-':) <$ (pSym '-'))) `opt` id

lexeme p = p <* pSpaces

-- taken from Doaitse's demo
pManyTill :: Parser a -> Parser b -> Parser [a]
pManyTill p end      = scan
    where
      scan  = end *> pSucceed []
              <|>
              (:) <$> p <*> scan


pAscii :: Parser Char
pAscii = pNoneSym []

-- it's not awsm, but it works
anyChar = pAscii


--execParser :: TokenParser a -> [Token] -> Either [String] a
execParser p tks
  = if null msgs
    then final `seq` Right v
    else Left (map show msgs)
  where
    steps = parse p tks
    msgs  = getMsgs steps
    (Pair v final) = evalSteps steps


optional :: Parser a -> Parser ()
optional p =  p *> pSucceed () <|> pSucceed ()

-- if using Data.Text, this function is provided
-- and is more efficient
strip      :: String -> String
strip      = f . f
    where f = reverse . dropWhile isSpace

space :: Parser Char
space = pAnySym " \r\n\t"

skipMany p = pList p *> pSucceed ()

skipMany1 p = p *> skipMany1 p


run :: Parser a -> String -> Either [String] a
run = execParser

