module Main where

import Criterion.Main


-- CSV
import qualified Parsing.Bench.Attoparsec.CSV as APCV
import qualified Parsing.Bench.Parsec2.CSV as P2CV
import qualified Parsing.Bench.Parsec3.CSV as P3CV
import qualified Parsing.Bench.UU1.CSV as U1CV
import qualified Parsing.Bench.UU2.CSV as U2CV
import qualified Parsing.Bench.Polyparse.CSV as PPCV

-- Expr
import qualified Parsing.Bench.Attoparsec.Expr as APEX
import qualified Parsing.Bench.Parsec2.Expr as P2EX
import qualified Parsing.Bench.Parsec3.Expr as P3EX
import qualified Parsing.Bench.UU1.Expr as U1EX
import qualified Parsing.Bench.UU2.Expr as U2EX
import qualified Parsing.Bench.Polyparse.Expr as PPEX

-- URL
import qualified Parsing.Bench.Attoparsec.URL as APUR
import qualified Parsing.Bench.Parsec2.URL as P2UR
import qualified Parsing.Bench.Parsec3.URL as P3UR
import qualified Parsing.Bench.UU1.URL as U1UR
import qualified Parsing.Bench.UU2.URL as U2UR
import qualified Parsing.Bench.Polyparse.URL as PPUR

-- HTTP
import qualified Parsing.Bench.Attoparsec.HTTP as APHT
import qualified Parsing.Bench.Parsec2.HTTP as P2HT
import qualified Parsing.Bench.Parsec3.HTTP as P3HT
import qualified Parsing.Bench.UU1.HTTP as U1HT
import qualified Parsing.Bench.UU2.HTTP as U2HT
import qualified Parsing.Bench.Polyparse.HTTP as PPHT

-- JSON
import qualified Parsing.Bench.Attoparsec.JSON as APJS
import qualified Parsing.Bench.Parsec2.JSON as P2JS
import qualified Parsing.Bench.Parsec3.JSON as P3JS
import qualified Parsing.Bench.UU1.JSON as U1JS
import qualified Parsing.Bench.UU2.JSON as U2JS
import qualified Parsing.Bench.Polyparse.JSON as PPJS

-- CSS
import qualified Parsing.Bench.Attoparsec.CSS as APCS
import qualified Parsing.Bench.Parsec2.CSS as P2CS
import qualified Parsing.Bench.Parsec3.CSS as P3CS
import qualified Parsing.Bench.UU1.CSS2 as U1CS
import qualified Parsing.Bench.UU2.CSS as U2CS
import qualified Parsing.Bench.Polyparse.CSS as PPCS



main = do
  -- Lazy load the inputs
  inpCV <- readFile "../data/csv/3.csv"
  inpEX <- readFile "../data/expr/9.expr"
  inpUR <- readFile "../data/url/4.url"
  inpHT <- readFile "../data/http/6.http"
  inpJS <- readFile "../data/json/4.json"
  inpCS <- readFile "../data/css/2_nc.css"

  defaultMain $ [
        bgroup "csv" [
                    bench "AP" $ whnf APCV.run inpCV
                   ,bench "P2" $ whnf P2CV.run inpCV
                   ,bench "P3" $ whnf P3CV.run inpCV
                   ,bench "U1" $ whnf U1CV.run inpCV
                   ,bench "U2" $ whnf U2CV.run inpCV
                   ,bench "PP" $ whnf PPCV.run inpCV
                   ]
       ,bgroup "expr" [
                    bench "AP" $ whnf APEX.run inpEX
                   ,bench "P2" $ whnf P2EX.run inpEX
                   ,bench "P3" $ whnf P3EX.run inpEX
                   ,bench "U1" $ whnf U1EX.run inpEX
                   ,bench "U2" $ whnf U2EX.run inpEX
                   ,bench "PP" $ whnf PPEX.run inpEX
                   ]
       ,bgroup "url" [
                    bench "AP" $ whnf APUR.run inpUR
                   ,bench "P2" $ whnf P2UR.run inpUR
                   ,bench "P3" $ whnf P3UR.run inpUR
                   ,bench "U1" $ whnf U1UR.run inpUR
                   ,bench "U2" $ whnf U2UR.run inpUR
                   ,bench "PP" $ whnf PPUR.run inpUR
                   ]
       ,bgroup "http" [
                    bench "AP" $ whnf APHT.run inpHT
                   ,bench "P2" $ whnf P2HT.run inpHT
                   ,bench "P3" $ whnf P3HT.run inpHT
                   ,bench "U1" $ whnf U1HT.run inpHT
                   ,bench "U2" $ whnf U2HT.run inpHT
                   ,bench "PP" $ whnf PPHT.run inpHT
                   ]
       ,bgroup "json" [
                    bench "AP" $ whnf APJS.run inpJS
                   ,bench "P2" $ whnf P2JS.run inpJS
                   ,bench "P3" $ whnf P3JS.run inpJS
                   ,bench "U1" $ whnf U1JS.run inpJS
                   ,bench "U2" $ whnf U2JS.run inpJS
                   ,bench "PP" $ whnf PPJS.run inpJS
                   ]
       ,bgroup "css" [
                    bench "AP" $ whnf APCS.run inpCS
                   ,bench "P2" $ whnf P2CS.run inpCS
                   ,bench "P3" $ whnf P3CS.run inpCS
                   ,bench "U1" $ whnf U1CS.run inpCS
                   ,bench "U2" $ whnf U2CS.run inpCS
                   ,bench "PP" $ whnf PPCS.run inpCS
                   ]


       ]