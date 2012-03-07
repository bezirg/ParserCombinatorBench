#!/bin/bash

mkdir -p gc-nf-results

./dist/build/css-ap-nf/css-ap-nf +RTS -scss-ap-nf.gc -RTS  > /dev/null ; mv css-ap-nf.gc gc-nf-results
./dist/build/css-p2-nf/css-p2-nf +RTS -scss-p2-nf.gc -RTS  > /dev/null ; mv css-p2-nf.gc gc-nf-results
./dist/build/css-p3-nf/css-p3-nf +RTS -scss-p3-nf.gc -RTS  > /dev/null ; mv css-p3-nf.gc gc-nf-results
./dist/build/css-u1-nf/css-u1-nf +RTS -scss-u1-nf.gc -RTS  > /dev/null ; mv css-u1-nf.gc gc-nf-results
./dist/build/css-u2-nf/css-u2-nf +RTS -scss-u2-nf.gc -RTS  > /dev/null ; mv css-u2-nf.gc gc-nf-results
./dist/build/css-pp-nf/css-pp-nf +RTS -scss-pp-nf.gc -RTS  > /dev/null ; mv css-pp-nf.gc gc-nf-results

./dist/build/csv-ap-nf/csv-ap-nf +RTS -scsv-ap-nf.gc -RTS  > /dev/null ; mv csv-ap-nf.gc gc-nf-results
./dist/build/csv-p2-nf/csv-p2-nf +RTS -scsv-p2-nf.gc -RTS  > /dev/null ; mv csv-p2-nf.gc gc-nf-results
./dist/build/csv-p3-nf/csv-p3-nf +RTS -scsv-p3-nf.gc -RTS  > /dev/null ; mv csv-p3-nf.gc gc-nf-results
./dist/build/csv-u1-nf/csv-u1-nf +RTS -scsv-u1-nf.gc -RTS  > /dev/null ; mv csv-u1-nf.gc gc-nf-results
./dist/build/csv-u2-nf/csv-u2-nf +RTS -scsv-u2-nf.gc -RTS  > /dev/null ; mv csv-u2-nf.gc gc-nf-results
./dist/build/csv-pp-nf/csv-pp-nf +RTS -scsv-pp-nf.gc -RTS  > /dev/null ; mv csv-pp-nf.gc gc-nf-results

./dist/build/http-ap-nf/http-ap-nf +RTS -shttp-ap-nf.gc -RTS  > /dev/null ; mv http-ap-nf.gc gc-nf-results
./dist/build/http-p2-nf/http-p2-nf +RTS -shttp-p2-nf.gc -RTS  > /dev/null ; mv http-p2-nf.gc gc-nf-results
./dist/build/http-p3-nf/http-p3-nf +RTS -shttp-p3-nf.gc -RTS  > /dev/null ; mv http-p3-nf.gc gc-nf-results
./dist/build/http-u1-nf/http-u1-nf +RTS -shttp-u1-nf.gc -RTS  > /dev/null ; mv http-u1-nf.gc gc-nf-results
./dist/build/http-u2-nf/http-u2-nf +RTS -shttp-u2-nf.gc -RTS  > /dev/null ; mv http-u2-nf.gc gc-nf-results
./dist/build/http-pp-nf/http-pp-nf +RTS -shttp-pp-nf.gc -RTS  > /dev/null ; mv http-pp-nf.gc gc-nf-results

./dist/build/expr-ap-nf/expr-ap-nf +RTS -sexpr-ap-nf.gc -RTS  > /dev/null ; mv expr-ap-nf.gc gc-nf-results
./dist/build/expr-p2-nf/expr-p2-nf +RTS -sexpr-p2-nf.gc -RTS  > /dev/null ; mv expr-p2-nf.gc gc-nf-results
./dist/build/expr-p3-nf/expr-p3-nf +RTS -sexpr-p3-nf.gc -RTS  > /dev/null ; mv expr-p3-nf.gc gc-nf-results
./dist/build/expr-u1-nf/expr-u1-nf +RTS -sexpr-u1-nf.gc -RTS  > /dev/null ; mv expr-u1-nf.gc gc-nf-results
./dist/build/expr-u2-nf/expr-u2-nf +RTS -sexpr-u2-nf.gc -RTS  > /dev/null ; mv expr-u2-nf.gc gc-nf-results
./dist/build/expr-pp-nf/expr-pp-nf +RTS -sexpr-pp-nf.gc -RTS  > /dev/null ; mv expr-pp-nf.gc gc-nf-results

./dist/build/json-ap-nf/json-ap-nf +RTS -sjson-ap-nf.gc -RTS  > /dev/null ; mv json-ap-nf.gc gc-nf-results
./dist/build/json-p2-nf/json-p2-nf +RTS -sjson-p2-nf.gc -RTS  > /dev/null ; mv json-p2-nf.gc gc-nf-results
./dist/build/json-p3-nf/json-p3-nf +RTS -sjson-p3-nf.gc -RTS  > /dev/null ; mv json-p3-nf.gc gc-nf-results
./dist/build/json-u1-nf/json-u1-nf +RTS -sjson-u1-nf.gc -RTS  > /dev/null ; mv json-u1-nf.gc gc-nf-results
./dist/build/json-u2-nf/json-u2-nf +RTS -sjson-u2-nf.gc -RTS  > /dev/null ; mv json-u2-nf.gc gc-nf-results
./dist/build/json-pp-nf/json-pp-nf +RTS -sjson-pp-nf.gc -RTS  > /dev/null ; mv json-pp-nf.gc gc-nf-results

./dist/build/url-ap-nf/url-ap-nf +RTS -surl-ap-nf.gc -RTS  > /dev/null ; mv url-ap-nf.gc gc-nf-results
./dist/build/url-p2-nf/url-p2-nf +RTS -surl-p2-nf.gc -RTS  > /dev/null ; mv url-p2-nf.gc gc-nf-results
./dist/build/url-p3-nf/url-p3-nf +RTS -surl-p3-nf.gc -RTS  > /dev/null ; mv url-p3-nf.gc gc-nf-results
./dist/build/url-u1-nf/url-u1-nf +RTS -surl-u1-nf.gc -RTS  > /dev/null ; mv url-u1-nf.gc gc-nf-results
./dist/build/url-u2-nf/url-u2-nf +RTS -surl-u2-nf.gc -RTS  > /dev/null ; mv url-u2-nf.gc gc-nf-results
./dist/build/url-pp-nf/url-pp-nf +RTS -surl-pp-nf.gc -RTS  > /dev/null ; mv url-pp-nf.gc gc-nf-results


