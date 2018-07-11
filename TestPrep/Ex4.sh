#!/usr/bin/env bash
file=$1
i=$2
j=$3
counter=0
>|ex4tmp
while read line; do
    if [[ $counter -ne $(($i-1)) ]]; then
    echo $line >> ex4tmp
    fi
    counter=$((counter+1))
done < $file
while read line; do
counter=0
    for elm in $line
    do
        if [[ $counter -ne $(($j-1)) ]]; then
        echo -n $elm" "
        fi
        counter=$((counter+1))
    done
    echo
done <ex4tmp