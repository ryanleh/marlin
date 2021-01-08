#!/bin/bash

mkdir -p results
err="results/err.log"

for c in {15..25}
do
    echo "Running snark delegator with 2^$c constraints"
    run_path="results/snark_$c.txt"
    env CLICOLOR=0 cargo bench --all-features -- $c 2>$err > $run_path;
    cat "$run_path" | egrep "End.*Marlin::Prover"
    echo -e "\n"
done
