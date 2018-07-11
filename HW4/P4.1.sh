#!/usr/bin/env bash
read cmd
i=$(echo $cmd | cut -d" " -f1)
j=$(echo $cmd | cut -d" " -f2)
k=$(echo $cmd | cut -d" " -f3)
limit=$[$i+$j]
sum=$i;

for i in $(seq $limit); do
			echo -n $sum;
				for z in $(seq $i); do
					echo -n '@';
				done
			sum=$[$sum+$j];
	done
	echo -n $sum;
echo