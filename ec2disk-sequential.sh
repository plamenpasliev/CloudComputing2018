
#!/bin/bash

(date +%s; echo ","; (/usr/bin/time -v  dd if=/dev/zero bs=64000 count=10000 of=file_1GB)  2>&1 >/dev/null | grep 'Elapsed' | cut -d ' ' -f 8 | cut -d ':' -f 2;) | tr "\n" " ">>dd.csv
echo>>disk-sequential.csv


