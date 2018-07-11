#!/usr/bin/env bash
function HandleFile
{
	rep=$(echo 4(cat $1) | tr " " "\n" | sort | uniq | wc -l)
	echo $(cat $1) | tr " " "\n" | uniq -c | sort -nr >| tmp
	max=0
	while read x; do
		num=$(echo $x | cut -d" " -f1)
		if [ $num -gt $max ] ; then
			max=$num
		fi
	done < tmp
	echo $1 $rep $max
}
for F in $* ; do
	HandleFile $F
done
*