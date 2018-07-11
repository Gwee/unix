#!/usr/bin/env bash
echo -n "Enter parameters in the format file-mum1-num2:c1-c2:d1-d2 "
read params
filename=$(echo $params | cut -d"-" -f1)
lines=$(echo $params | cut -s -d":" -f1 | cut -d"-" -f2-3)
chars=$(echo $params | cut -s -d":" -f2)
words=$(echo $params | cut -d":" -f3-4)
counter=1
head=$(echo $lines | cut -d"-" -f1)
tail=$(echo $lines | cut -d"-" -f2)
while read line ;
do
  if [ "$counter" -ge "$head" -a "$counter" -le "$tail" ]; then
    char_line=$(echo -n "$line" | cut -c$chars)
    word_line=$(echo -n "$line" | cut -d" " -f$words)
    if [[ -z $output ]]; then
        output="$counter:$char_line$word_line"
    else
        output=$"$output
$counter:$char_line$word_line"
    fi
  fi
  counter=$((counter+1))
done< $filename
echo "$output"