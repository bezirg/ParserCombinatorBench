{-# LANGUAGE CPP #-}

module Main where

#include "Parsers.h"

import Criterion.Main

-- perror = error "Parsing Failed"

-- fromDone (Done _ x) = x
-- fromDone _ = perror

-- fromRight (Right x) = x
-- fromRight _ = perror

-- fromFst (x,[]) = x
-- fromFst _ = perror

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
                    bench "AP" $ whnf APCV.run tinpCV
                   ,bench "P2" $ whnf P2CV.run inpCV
                   ,bench "P3" $ whnf P3CV.run inpCV
                   ,bench "U1" $ whnf U1CV.run inpCV
                   ,bench "U2" $ whnf U2CV.run inpCV
                   ,bench "PP" $ whnf PPCV.run inpCV
                   ]
       ,bgroup "expr" [
                    bench "AP" $ whnf APEX.run tinpEX
                   ,bench "P2" $ whnf P2EX.run inpEX
                   ,bench "P3" $ whnf P3EX.run inpEX
                   ,bench "U1" $ whnf U1EX.run inpEX
                   ,bench "U2" $ whnf U2EX.run inpEX
                   ,bench "PP" $ whnf PPEX.run inpEX
                   ]
       ,bgroup "url" [
                    bench "AP" $ whnf APUR.run tinpUR
                   ,bench "P2" $ whnf P2UR.run inpUR
                   ,bench "P3" $ whnf P3UR.run inpUR
                   ,bench "U1" $ whnf U1UR.run inpUR
                   ,bench "U2" $ whnf U2UR.run inpUR
                   ,bench "PP" $ whnf PPUR.run inpUR
                   ]
       ,bgroup "http" [
                    bench "AP" $ whnf APHT.run tinpHT
                   ,bench "P2" $ whnf P2HT.run inpHT
                   ,bench "P3" $ whnf P3HT.run inpHT
                   ,bench "U1" $ whnf U1HT.run inpHT
                   ,bench "U2" $ whnf U2HT.run inpHT
                   ,bench "PP" $ whnf PPHT.run inpHT
                   ]
       ,bgroup "json" [
                    bench "AP" $ whnf APJS.run tinpJS
                   ,bench "P2" $ whnf P2JS.run inpJS
                   ,bench "P3" $ whnf P3JS.run inpJS
                   ,bench "U1" $ whnf U1JS.run inpJS
                   ,bench "U2" $ whnf U2JS.run inpJS
                   ,bench "PP" $ whnf PPJS.run inpJS
                   ]
       ,bgroup "css" [
                    bench "AP" $ whnf APCS.run tinpCS
                   ,bench "P2" $ whnf P2CS.run inpCS
                   ,bench "P3" $ whnf P3CS.run inpCS
                   ,bench "U1" $ whnf U1CS.run inpCS
                   ,bench "U2" $ whnf U2CS.run inpCS
                   ,bench "PP" $ whnf PPCS.run inpCS
                   ]


       ]