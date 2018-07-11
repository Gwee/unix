#!/usr/bin/env bash
function check_matrix {
    file=$1
    num_of_rows=$(wc -l $file |cut -c1)
    
    while read line; do
        num_of_cols=$(echo $line | tr -s " " "\n" | wc -l)
        
        if [[ $num_of_rows != $num_of_cols ]]; then
            check_matrix="false"
            return
        fi
    done < $file
    check_matrix="true"
}
for dir in $*
do
    for file in $(find $dir -type f)
    do
        check_matrix $file
        if [ $check_matrix == "true" ]; then
            echo $file >> to_print
        fi
    done
done
cat to_print | sort -d