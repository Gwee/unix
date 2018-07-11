#!/usr/bin/env bash
file=$1
number_of_params=$#

for param in $*
do
    if [ "$param" == "$file" ]
    then
        continue
    else
        if [ "$paramArr" == "" ]
        then
            paramArr="%"$param"s"
        else
            paramArr="$paramArr %"$param"s"
        fi
    fi

for i in $(seq $(($number_of_params -1)))
do 
    awkArr="$awkArr \$$i,"
done
done
while read line; do
    echo $line
done < $file

awkArray=$(echo $awkArr | sed 's/.$//')
result="awk '\''{printf \"$paramArr\n\" ,$awkArray}'\''"
# cat $file | $result
#echo $result

