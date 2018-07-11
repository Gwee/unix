#!/usr/bin/env bash
##SPECIAL CASES##
echo "Enter dimension: "
read x
#x=4
if [ $x -eq 1 ]
then
  echo $x
  exit
fi
if [ $x -eq 2 ]
then
  echo $x $x
  echo $x $x
  exit
fi
##END SPECIAL CASES##
first_row=""
for z in $(seq $x)
do
  first_row="$first_row $x"
done
echo "$first_row"
spaces=""
num_of_spaces=$[$x*2 - 3]
for z in $(seq $num_of_spaces)
do
  spaces="$spaces "
done
mid_row="$x$spaces$x"
for z in $(seq $[$x-2])
do
  echo "$mid_row"
done
echo "$first_row"
