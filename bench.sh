#!/bin/bash

# compile
cabal clean &&
cabal configure &&
cabal build &&

# test
./dist/build/test/test &&


# time
./dist/build/bench-nf/bench-nf -g -s 10 -o bench-nf.html -u bench-nf.csv &&
./dist/build/bench-whnf/bench-whnf -g -s 10 -o bench-whnf.html -u bench-whnf.csv &&

# space
source prof-nf.sh &&
source prof-whnf.sh &&
source hp-nf.sh &&
source hp-whnf.sh &&
source gc-nf.sh &&
source gc-whnf.sh &&

echo "success"