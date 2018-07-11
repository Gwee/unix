#!/usr/bin/env bash
string=$(echo $1 | egrep -o .)
echo $string
char=$(echo $1 | egrep -o . | tail -2 | head -1)
echo $char
counter=0
while read line; do
if [ $line = $char ]; then
    counter=$(($counter+1))
fi
done<<<$string
echo $counter
