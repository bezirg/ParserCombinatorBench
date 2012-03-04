{-# LANGUAGE CPP #-}

module Main where

#include "Parsers.h"

import Criterion.Main
import Data.Attoparsec.Text

perror = error "Parsing Failed"

fromDone (Done _ x) = x
fromDone _ = perror

fromRight (Right x) = x
fromRight _ = perror

fromFst (x,[]) = x
fromFst _ = perror

main = do
  -- Lazy load the String inputs
  inpCV <- readFile "data/csv/bench.csv"
  inpEX <- readFile "data/expr/bench.expr"
  inpUR <- readFile "data/url/bench.url"
  inpHT <- readFile "data/http/bench.http"
  inpJS <- readFile "data/json/bench.json"
  inpCS <- readFile "data/css/bench.css"

  -- Lazy load the Text inputs
  tinpCV <- TIO.readFile "data/csv/bench.csv"
  tinpEX <- TIO.readFile "data/expr/bench.expr"
  tinpUR <- TIO.readFile "data/url/bench.url"
  tinpHT <- TIO.readFile "data/http/bench.http"
  tinpJS <- TIO.readFile "data/json/bench.json"
  tinpCS <- TIO.readFile "data/css/bench.css"

  defaultMain $ [
        bgroup "csv" [
                    bench "AP" $ nf (fromDone . APCV.run) tinpCV
                   ,bench "P2" $ nf (fromRight . P2CV.run) inpCV
                   ,bench "P3" $ nf (fromRight . P3CV.run) inpCV
                   ,bench "U1" $ nf (fromRight . U1CV.run) inpCV
                   ,bench "U2" $ nf (fromFst . U2CV.run) inpCV
                   ,bench "PP" $ nf (fromRight . fromFst . PPCV.run) inpCV
                   ]
       ,bgroup "expr" [
                    bench "AP" $ nf (fromDone . APEX.run) tinpEX
                   ,bench "P2" $ nf (fromRight . P2EX.run) inpEX
                   ,bench "P3" $ nf (fromRight . P3EX.run) inpEX
                   ,bench "U1" $ nf (fromRight . U1EX.run) inpEX
                   ,bench "U2" $ nf (fromFst . U2EX.run) inpEX
                   ,bench "PP" $ nf (fromRight . fromFst . PPEX.run) inpEX
                   ]
       ,bgroup "url" [
                    bench "AP" $ nf (fromDone . APUR.run) tinpUR
                   ,bench "P2" $ nf (fromRight . P2UR.run) inpUR
                   ,bench "P3" $ nf (fromRight . P3UR.run) inpUR
                   ,bench "U1" $ nf (fromRight . U1UR.run) inpUR
                   ,bench "U2" $ nf (fromFst . U2UR.run) inpUR
                   ,bench "PP" $ nf (fromRight . fromFst . PPUR.run) inpUR
                   ]
       ,bgroup "http" [
                    bench "AP" $ nf (fromDone . APHT.run) tinpHT
                   ,bench "P2" $ nf (fromRight . P2HT.run) inpHT
                   ,bench "P3" $ nf (fromRight . P3HT.run) inpHT
                   ,bench "U1" $ nf (fromRight . U1HT.run) inpHT
                   ,bench "U2" $ nf (fromFst . U2HT.run) inpHT
                   ,bench "PP" $ nf (fromRight . fromFst . PPHT.run) inpHT
                   ]
       ,bgroup "json" [
                    bench "AP" $ nf (fromDone . APJS.run) tinpJS
                   ,bench "P2" $ nf (fromRight . P2JS.run) inpJS
                   ,bench "P3" $ nf (fromRight . P3JS.run) inpJS
                   ,bench "U1" $ nf (fromRight . U1JS.run) inpJS
                   ,bench "U2" $ nf (fromFst . U2JS.run) inpJS
                   ,bench "PP" $ nf (fromRight . fromFst . PPJS.run) inpJS
                   ]
       ,bgroup "css" [
                    bench "AP" $ nf (fromDone . APCS.run) tinpCS
                   ,bench "P2" $ nf (fromRight . P2CS.run) inpCS
                   ,bench "P3" $ nf (fromRight . P3CS.run) inpCS
                   ,bench "U1" $ nf (fromRight . U1CS.run) inpCS
                   ,bench "U2" $ nf (fromFst . U2CS.run) inpCS
                   ,bench "PP" $ nf (fromRight . fromFst . PPCS.run) inpCS
                   ]


       ]