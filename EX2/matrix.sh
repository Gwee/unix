#!/usr/bin/env bash
echo "Enter matrix dimension: "

read x
#x=4
for i in $(seq $x)
    do
        y=""
        for j in $(seq $x)
            do
                y="$y $i"
            done
            echo " " $y
    done
