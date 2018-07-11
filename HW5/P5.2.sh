#!/usr/bin/env bash
string=$1
for i in $(seq 10) #TODO: this cut deals with all sizes of repeats
do
    repeats=$(echo "$string" | egrep -o . | uniq -c | sort -nr | head -1 | cut -d" " -f$i)
    if [[ -n $repeats ]]; then
        break
    fi
done
echo $repeats
