#!/bin/bash

cd /root
cd fio*
./fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=test --bs=4k --iodepth=64 --size=400mb --readwrite=randrw --rwmixread=75


