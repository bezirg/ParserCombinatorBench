{-# LANGUAGE CPP #-}

module Main where

import Test.HUnit

#include "Parsers.h"

import Parsing.Bench.AST.JSON
import Parsing.Bench.AST.Expr
import Parsing.Bench.AST.HTTP

fromRight (Right v) = v
fromRight _ = error "parsing failed"

fromFst (v, []) = v
fromFst _ = error "parsing failed"

main = do

#include "Test.h"

  -- Tested against the outputs of the Attoparsec Parser

  runTestTT $ test [-- "ap" ~: test [
                    --                "csv" ~: outCV ~=? fromDone (APCV.run inpCV)  , 
                    --                "expr" ~: outEX ~=? fromDone (APEX.run inpEX) ,
                    --                "url" ~: outUR ~=? fromDone (APUR.run inpUR) ,
                    --                "http" ~: outHT ~=? fromDone (APHT.run inpHT) ,
                    --                "json" ~: outJS ~=? fromDone (APJS.run inpJS) ,
                    --                "css" ~: outCS ~=? fromDone (APCS.run inpCS)
                    --              ],
                        "p2" ~: test [
                                   "csv" ~: outCV ~=? fromRight ( P2CV.run inpCV ) , 
                                   "expr" ~: outEX ~=? fromRight ( P2EX.run inpEX) ,
                                   "url" ~: outUR ~=? fromRight ( P2UR.run inpUR) ,
                                   "http" ~: outHT ~=? fromRight ( P2HT.run inpHT) ,
                                   "json" ~: outJS ~=? fromRight ( P2JS.run inpJS) ,
                                   "css" ~: outCS ~=? fromRight ( P2CS.run inpCS)
                                 ],
                        "p3" ~:  test [
                                   "csv" ~: outCV ~=? fromRight ( P3CV.run inpCV ) , 
                                   "expr" ~: outEX ~=? fromRight ( P3EX.run inpEX) ,
                                   "url" ~: outUR ~=? fromRight ( P3UR.run inpUR) ,
                                   "http" ~: outHT ~=? fromRight ( P3HT.run inpHT) ,
                                   "json" ~: outJS ~=? fromRight ( P3JS.run inpJS) ,
                                   "css" ~: outCS ~=? fromRight ( P3CS.run inpCS)
                                 ],
                        "u1" ~: test [
                                   "csv" ~: outCV ~=? fromRight ( U1CV.run inpCV ) , 
                                   "expr" ~: outEX ~=? fromRight ( U1EX.run inpEX) ,
                                   "url" ~: outUR ~=? fromRight ( U1UR.run inpUR) ,
                                   "http" ~: outHT ~=? fromRight ( U1HT.run inpHT) ,
                                   "json" ~: outJS ~=? fromRight ( U1JS.run inpJS) ,
                                   "css" ~: outCS ~=? fromRight ( U1CS.run inpCS)
                                 ],
                        "u2" ~: test [
                                   "csv" ~: outCV ~=? fromFst ( U2CV.run inpCV ) , 
                                   "expr" ~: outEX ~=? fromFst ( U2EX.run inpEX) ,
                                   "url" ~: outUR ~=? fromFst ( U2UR.run inpUR) ,
                                   "http" ~: outHT ~=? fromFst ( U2HT.run inpHT) ,
                                   "json" ~: outJS ~=? fromFst ( U2JS.run inpJS) ,
                                   "css" ~: outCS ~=? fromFst ( U2CS.run inpCS)
                                 ],
                        "pp" ~: test [
                                   "csv" ~: outCV ~=? (fromRight . fromFst) (PPCV.run inpCV ) , 
                                   "expr" ~: outEX ~=? (fromRight . fromFst) (PPEX.run inpEX) ,
                                   "url" ~: outUR ~=? (fromRight . fromFst) (PPUR.run inpUR) ,
                                   "http" ~: outHT ~=? (fromRight . fromFst) (PPHT.run inpHT) ,
                                   "json" ~: outJS ~=? (fromRight . fromFst) (PPJS.run inpJS) ,
                                   "css" ~: outCS ~=? (fromRight . fromFst) (PPCS.run inpCS)
                                 ]
                       ]


