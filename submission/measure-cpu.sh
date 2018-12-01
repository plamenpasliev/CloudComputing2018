#!/bin/bash 
EXECUTABLE="measure-cpu"
if [ ! -e $EXECUTABLE ] ; then
	echo "Compiling measure-cpu.c (requires GNU compiler collection)"
	gcc -O -o measure-cpu measure-cpu.c -lm
fi

./measure-cpu
