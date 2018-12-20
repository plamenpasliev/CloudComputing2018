#!/bin/bash

timestamp() {
  date +"%s"
}

EXECUTABLE="linpack"
if [ ! -e $EXECUTABLE ] ; then
	gcc -O -o linpack measure-cpu.c -lm
fi


if [ "$SYSTEMROOT" = "C:\Windows" ] ; then
	result=$(./linpack.exe | tail -1 | sed "s/[[:blank:]]\+/ /g" | cut -d " " -f 7)
else
	result=$(./${EXECUTABLE} | tail -1 | sed "s/[[:blank:]]\+/ /g" | cut -d " " -f 7)
fi

(date +%s; echo ", $result")| tr "\n" " " >> result.csv
echo "$result"
