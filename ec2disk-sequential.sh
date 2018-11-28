#!/bin/bash

(date +%s; echo ","; (/usr/bin/time -v   sh dd.sh)  2>&1 >/dev/null | grep 'System time' | cut -d ' ' -f 4;) | tr "\n" " ">>dd.csv
echo>>dd.csv


