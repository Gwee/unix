#!/usr/bin/env bash
>|tmp
file=$2
i=$1
while read line; do
    for x in $line; do
            count=0
            flag=true
        for W in $*; do
            ((count++))
            if [ $count -gt 2 ]; then
                if [ $i -ne $(echo $x | egrep -o $W | wc -l) ]
                then
                    flag=false
                    break
                fi
            fi
        done
        if [ $flag = true ]
        then
            echo $x >> tmp
        fi
    done
done <$file
cat tmp | sort
