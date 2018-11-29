#!/bin/bash

(date +%s; echo ","; (/usr/bin/time -v /root/fio*/fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=test --bs=4k --iodepth=64 --size=100mb --readwrite=randrw --rwmixread=75)  2>&1 >/dev/null | grep 'Elapsed' | cut -d ' ' -f 8 | cut -d ':' -f 2;) | tr "\n" " ">>  fio.csv
echo>>disk-random.csv


