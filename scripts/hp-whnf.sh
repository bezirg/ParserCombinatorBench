#!/bin/bash

mkdir -p hp-whnf-results

./dist/build/css-ap-whnf/css-ap-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv css-ap-whnf.hp hp-whnf-results
./dist/build/css-p2-whnf/css-p2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv css-p2-whnf.hp hp-whnf-results
./dist/build/css-p3-whnf/css-p3-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv css-p3-whnf.hp hp-whnf-results
./dist/build/css-u1-whnf/css-u1-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv css-u1-whnf.hp hp-whnf-results
./dist/build/css-u2-whnf/css-u2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv css-u2-whnf.hp hp-whnf-results
./dist/build/css-pp-whnf/css-pp-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv css-pp-whnf.hp hp-whnf-results

./dist/build/csv-ap-whnf/csv-ap-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv csv-ap-whnf.hp hp-whnf-results
./dist/build/csv-p2-whnf/csv-p2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv csv-p2-whnf.hp hp-whnf-results
./dist/build/csv-p3-whnf/csv-p3-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv csv-p3-whnf.hp hp-whnf-results
./dist/build/csv-u1-whnf/csv-u1-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv csv-u1-whnf.hp hp-whnf-results
./dist/build/csv-u2-whnf/csv-u2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv csv-u2-whnf.hp hp-whnf-results
./dist/build/csv-pp-whnf/csv-pp-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv csv-pp-whnf.hp hp-whnf-results

./dist/build/http-ap-whnf/http-ap-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv http-ap-whnf.hp hp-whnf-results
./dist/build/http-p2-whnf/http-p2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv http-p2-whnf.hp hp-whnf-results
./dist/build/http-p3-whnf/http-p3-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv http-p3-whnf.hp hp-whnf-results
./dist/build/http-u1-whnf/http-u1-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv http-u1-whnf.hp hp-whnf-results
./dist/build/http-u2-whnf/http-u2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv http-u2-whnf.hp hp-whnf-results
./dist/build/http-pp-whnf/http-pp-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv http-pp-whnf.hp hp-whnf-results

./dist/build/expr-ap-whnf/expr-ap-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv expr-ap-whnf.hp hp-whnf-results
./dist/build/expr-p2-whnf/expr-p2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv expr-p2-whnf.hp hp-whnf-results
./dist/build/expr-p3-whnf/expr-p3-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv expr-p3-whnf.hp hp-whnf-results
./dist/build/expr-u1-whnf/expr-u1-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv expr-u1-whnf.hp hp-whnf-results
./dist/build/expr-u2-whnf/expr-u2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv expr-u2-whnf.hp hp-whnf-results
./dist/build/expr-pp-whnf/expr-pp-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv expr-pp-whnf.hp hp-whnf-results

./dist/build/json-ap-whnf/json-ap-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv json-ap-whnf.hp hp-whnf-results
./dist/build/json-p2-whnf/json-p2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv json-p2-whnf.hp hp-whnf-results
./dist/build/json-p3-whnf/json-p3-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv json-p3-whnf.hp hp-whnf-results
./dist/build/json-u1-whnf/json-u1-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv json-u1-whnf.hp hp-whnf-results
./dist/build/json-u2-whnf/json-u2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv json-u2-whnf.hp hp-whnf-results
./dist/build/json-pp-whnf/json-pp-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv json-pp-whnf.hp hp-whnf-results

./dist/build/url-ap-whnf/url-ap-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv url-ap-whnf.hp hp-whnf-results
./dist/build/url-p2-whnf/url-p2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv url-p2-whnf.hp hp-whnf-results
./dist/build/url-p3-whnf/url-p3-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv url-p3-whnf.hp hp-whnf-results
./dist/build/url-u1-whnf/url-u1-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv url-u1-whnf.hp hp-whnf-results
./dist/build/url-u2-whnf/url-u2-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv url-u2-whnf.hp hp-whnf-results
./dist/build/url-pp-whnf/url-pp-whnf +RTS -hc -i0.05 -RTS  > /dev/null ; mv url-pp-whnf.hp hp-whnf-results

