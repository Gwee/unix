#!/usr/bin/env bash
a=(1aaa 2bbb 3ccc)
echo ${a[@]:1,2}
for element in "${a[@]}"
do
    echo $element
done