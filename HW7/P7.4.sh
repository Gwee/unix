#!/usr/bin/env bash
i1=$1; i2=$2
j1=$3; j2=$4
shift 4

lines=$i2
linesFile=$(wc -l < $1)
if [ $linesFile -lt $lines ]; then
    lines=$linesFile
fi
tochen=$(head -$lines $1 | tail -$[$lines-$i1+1] |tr -s " " |cut -sd" " -f$j1-$j2)

for word in $tochen;do
    flag=1;
    for file in $*; do
        lines=$i2
        linesFile=$(wc -l < $file)
        if [ $linesFile -lt $lines ]; then
            lines=$linesFile
        fi
        tochen2=$(head -$lines $file | tail -$[$lines-$i1+1] | tr -s " " | cut -sd" " -f $j1-$j2)
        toCheck=$(echo $tochen2 | egrep -ow $word | wc -l)
        if [ $toCheck -eq 0 ]; then
            flag=0;
        fi
    done
    if [ $flag -eq 1 ]; then
        echo $word >> match
    fi
    done
    while read word; do
        count=0
        for file in $*; do
            countWord=$(egrep -ow $word $file | wc -l)
            count=$[$count+$countWord]
        done
        echo $word $count >> tmp3
    done < match
cat tmp3 | sort -rk2
rm -f match tmp3
