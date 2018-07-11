#!/usr/bin/env bash
>|found
>|output
for folder in $*; do
    for file in $(find $folder -type f); do
        rows=$(cat $file | wc -l)
        found=true
        while read row; do
            cols=$(echo "$row" | tr " " "\n" | wc -l)
            if [ $rows -ne $cols ]; then
                found=false
            fi
        done <$file
        if [ $found = true ]; then
            name=$(echo $file | tr "/" "\n" | tail -1)
            echo $name/$file >> found
        fi
    done
done
cat found | sort >| found
while read line; do
    c=$(echo $line | tr "/" "\n" | wc -l)
    c=$[$c-1]
    echo -n $line | tr "/" "\n" |tail -$c | tr "\n" "/"
    echo ""
done < found
