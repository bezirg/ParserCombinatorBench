#!/bin/bash

mkdir -p prof-nf-results

./dist/build/css-ap-nf/css-ap-nf +RTS -p -RTS  > /dev/null ; mv css-ap-nf.prof prof-nf-results
./dist/build/css-p2-nf/css-p2-nf +RTS -p -RTS  > /dev/null ; mv css-p2-nf.prof prof-nf-results
./dist/build/css-p3-nf/css-p3-nf +RTS -p -RTS  > /dev/null ; mv css-p3-nf.prof prof-nf-results
./dist/build/css-u1-nf/css-u1-nf +RTS -p -RTS  > /dev/null ; mv css-u1-nf.prof prof-nf-results
./dist/build/css-u2-nf/css-u2-nf +RTS -p -RTS  > /dev/null ; mv css-u2-nf.prof prof-nf-results
./dist/build/css-pp-nf/css-pp-nf +RTS -p -RTS  > /dev/null ; mv css-pp-nf.prof prof-nf-results

./dist/build/csv-ap-nf/csv-ap-nf +RTS -p -RTS  > /dev/null ; mv csv-ap-nf.prof prof-nf-results
./dist/build/csv-p2-nf/csv-p2-nf +RTS -p -RTS  > /dev/null ; mv csv-p2-nf.prof prof-nf-results
./dist/build/csv-p3-nf/csv-p3-nf +RTS -p -RTS  > /dev/null ; mv csv-p3-nf.prof prof-nf-results
./dist/build/csv-u1-nf/csv-u1-nf +RTS -p -RTS  > /dev/null ; mv csv-u1-nf.prof prof-nf-results
./dist/build/csv-u2-nf/csv-u2-nf +RTS -p -RTS  > /dev/null ; mv csv-u2-nf.prof prof-nf-results
./dist/build/csv-pp-nf/csv-pp-nf +RTS -p -RTS  > /dev/null ; mv csv-pp-nf.prof prof-nf-results

./dist/build/http-ap-nf/http-ap-nf +RTS -p -RTS  > /dev/null ; mv http-ap-nf.prof prof-nf-results
./dist/build/http-p2-nf/http-p2-nf +RTS -p -RTS  > /dev/null ; mv http-p2-nf.prof prof-nf-results
./dist/build/http-p3-nf/http-p3-nf +RTS -p -RTS  > /dev/null ; mv http-p3-nf.prof prof-nf-results
./dist/build/http-u1-nf/http-u1-nf +RTS -p -RTS  > /dev/null ; mv http-u1-nf.prof prof-nf-results
./dist/build/http-u2-nf/http-u2-nf +RTS -p -RTS  > /dev/null ; mv http-u2-nf.prof prof-nf-results
./dist/build/http-pp-nf/http-pp-nf +RTS -p -RTS  > /dev/null ; mv http-pp-nf.prof prof-nf-results

./dist/build/expr-ap-nf/expr-ap-nf +RTS -p -RTS  > /dev/null ; mv expr-ap-nf.prof prof-nf-results
./dist/build/expr-p2-nf/expr-p2-nf +RTS -p -RTS  > /dev/null ; mv expr-p2-nf.prof prof-nf-results
./dist/build/expr-p3-nf/expr-p3-nf +RTS -p -RTS  > /dev/null ; mv expr-p3-nf.prof prof-nf-results
./dist/build/expr-u1-nf/expr-u1-nf +RTS -p -RTS  > /dev/null ; mv expr-u1-nf.prof prof-nf-results
./dist/build/expr-u2-nf/expr-u2-nf +RTS -p -RTS  > /dev/null ; mv expr-u2-nf.prof prof-nf-results
./dist/build/expr-pp-nf/expr-pp-nf +RTS -p -RTS  > /dev/null ; mv expr-pp-nf.prof prof-nf-results

./dist/build/json-ap-nf/json-ap-nf +RTS -p -RTS  > /dev/null ; mv json-ap-nf.prof prof-nf-results
./dist/build/json-p2-nf/json-p2-nf +RTS -p -RTS  > /dev/null ; mv json-p2-nf.prof prof-nf-results
./dist/build/json-p3-nf/json-p3-nf +RTS -p -RTS  > /dev/null ; mv json-p3-nf.prof prof-nf-results
./dist/build/json-u1-nf/json-u1-nf +RTS -p -RTS  > /dev/null ; mv json-u1-nf.prof prof-nf-results
./dist/build/json-u2-nf/json-u2-nf +RTS -p -RTS  > /dev/null ; mv json-u2-nf.prof prof-nf-results
./dist/build/json-pp-nf/json-pp-nf +RTS -p -RTS  > /dev/null ; mv json-pp-nf.prof prof-nf-results

./dist/build/url-ap-nf/url-ap-nf +RTS -p -RTS  > /dev/null ; mv url-ap-nf.prof prof-nf-results
./dist/build/url-p2-nf/url-p2-nf +RTS -p -RTS  > /dev/null ; mv url-p2-nf.prof prof-nf-results
./dist/build/url-p3-nf/url-p3-nf +RTS -p -RTS  > /dev/null ; mv url-p3-nf.prof prof-nf-results
./dist/build/url-u1-nf/url-u1-nf +RTS -p -RTS  > /dev/null ; mv url-u1-nf.prof prof-nf-results
./dist/build/url-u2-nf/url-u2-nf +RTS -p -RTS  > /dev/null ; mv url-u2-nf.prof prof-nf-results
./dist/build/url-pp-nf/url-pp-nf +RTS -p -RTS  > /dev/null ; mv url-pp-nf.prof prof-nf-results

