#!/bin/bash


(date +%s; echo ","; (/usr/bin/time -v  ./forksum 1 10000)  2>&1 >/dev/null | grep 'Elapsed' | cut -d ' ' -f 8 | cut -d ':' -f 2;) | tr "\n" " ">>  fork.csv
echo>>fork.csv
