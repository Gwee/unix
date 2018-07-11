#!/usr/bin/env bash
x=$(cat file)
wc=$(wc -w file)
echo $wc
echo $x
for (( i = 0; i < $wc;  i++ )); do
  echo $x
done
