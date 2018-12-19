#!/bin/bash

#URL="$1"
#externalprogram "$FILE" <other-parameters>

# the output file
FILE=nginx.csv

# the url to retrieve
URL=http://ec2-18-234-128-194.compute-1.amazonaws.com/file

#start two parallel downloads from the same url, b will store the sum of the results
a=$(curl $URL -o /dev/null -w "%{time_total}") &
b=$(curl $URL -o /dev/null -w "%{time_total}")
#average the values based on the number of instances
#echo "scale=4; $b / 2" | bc >> $FILE
#echo "" >> $FILE

(date +%s; echo ","; echo "scale=4; $b / 2" | bc;echo "";) | tr "\n" " ">> $FILE
echo >> $FILE


