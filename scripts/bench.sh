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
source ./scripts/prof-nf.sh &&
source ./scripts/prof-whnf.sh &&
source ./scripts/hp-nf.sh &&
source ./scripts/hp-whnf.sh &&
source ./scripts/gc-nf.sh &&
source ./scripts/gc-whnf.sh &&

echo "success"