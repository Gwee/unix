#!/usr/bin/env bash
echo -n "Enter file name: "
read file
sum=""
line_sum=0
line_counter=1
#remove empty lines from file
tmp_file=tmp$file
cat $file | tr -s '\n' '\n' > $tmp_file
dimension=$(wc -l < $tmp_file | tr -d '[:space:]')
while read line; do
    new_line=""
    #remove spaces between digits
    for digit in $line; do
        if [[ -z $new_line ]]; then
            new_line="$digit"
        else
            new_line="$new_line $digit"
        fi
        
    done
    range="$line_counter-$dimension"
    new_line=$(echo "$new_line" | cut -d" " -f$range)
    line_sum=0
    #calculate digits in line after cut
    for digit in $new_line; do
        line_sum=$(($digit+$line_sum))
    done
    sum=$(($sum+$line_sum))
    line_counter=$(($line_counter+1))
done < $tmp_file

echo "The sum of the upper triangle of $file is: $sum"