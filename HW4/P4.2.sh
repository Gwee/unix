#!/usr/bin/env bash
# P4.2 F1 3 5 2 4
# --------------
# 10 3 6 8 5
# 1 2 3 4 5 6 7 8
# 2 4 6 8 10
# 1 2 3 3 2 1
# 3 4 7 100
# ---------------------------
# 1 2 3 4 5 6 7 8
# 2 4 6 8 10
# 1 2 3 3 2 1
# --------------------------

read cmd
fileName=$(echo $cmd | cut -d" " -f1)
i=$(echo $cmd | cut -d" " -f2)
j=$(echo $cmd | cut -d" " -f3)
k=$(echo $cmd | cut -d" " -f4)
l=$(echo $cmd | cut -d" " -f5)

sum=0
numbers=$(head -$l $fileName | tail -$[$k+1] |cut -d" " -f$i-$j)
for i in $numbers; do
        sum=$[$sum+$i];
done
echo $sum
