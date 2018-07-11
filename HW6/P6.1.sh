#!/usr/bin/env bash
i=$1
j=$2
counter=0
#TODO: add the number of .'s from i-j including and then'
# function CountWords {
    for word in "$@"
    do
        counter=$((counter+1))
        if [[ $counter -gt 2 ]]; then
            echo $word | egrep "^(.+)\1{$(($i-1)),$(($j-1))}$"
        fi
    done
# }
# CountWords $strArray