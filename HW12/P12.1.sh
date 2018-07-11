#!/usr/bin/env bash
function element_in_matrix {
    local i=$1 j=$2 file=$3
    local counter=0
    local element=""
    file_length=$(wc -l $file | cut -f1 -d" ")
    
    if [ "$i" -gt "$file_length" ]; then
        echo 0; return
    fi
    line=$(head -$i $file | tail -1)
    number_of_words=$(echo $line | wc -w)
    if  [ $j -gt $number_of_words ]; then
        echo 0;return
    fi
    echo $line | cut -d" " -f$j
}

i=$1
j=$2
shift
shift
for file in $*; do
    element=$(element_in_matrix $i $j $file)
    sum=$(($sum+$element))
done
    echo $sum