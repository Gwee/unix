#!/usr/bin/env bash
file=$1
c=0;
while read line ; do
	((c++))
	if [ $[$c%2] -gt 0 ]; then
		echo $line | tr 6-9 a-d
	else
		echo $line | tr a-z A-Z
	fi
done <$file
