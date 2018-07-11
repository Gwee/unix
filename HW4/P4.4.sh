#!/usr/bin/env bash
>| tmp
>| tmp1
fname=$1
i=$2
j=$3
c=0
echo $(cat $fname) | tr " " "\n" | sort | uniq -c >| tmp
while read line ; do
  count=$(echo "$line" | cut -d " " -f1)
  if [ $count -ge $i ] && [ $count -le $j ]
  then
    ((c++))
  fi
done<tmp
echo $c
