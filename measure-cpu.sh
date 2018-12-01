#!/bin/bash 
EXECUTABLE="linpack"
if [ ! -e $EXECUTABLE ] ; then
	echo "Compiling measure-cpu.c (requires GNU compiler collection)"
	gcc -O -o linpack measure-cpu.c -lm
fi

