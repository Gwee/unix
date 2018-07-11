#!/usr/bin/env bash
##SPECIAL CASES##
echo -n "Enter number: "
read x
if [ $x -eq 1 ]
then
  echo "**"
  exit
fi
if [ $x -eq 2 ]
then
  echo "****"
  echo " ** "
  echo "****"
  exit
fi
##END SPECIAL CASES##
space_before=""
y=$[$x*2]
print_row=""

#print upper half - /TODO: we run +1 because the y -eq 0 condition needs to happen
for i in $(seq $[$x+1])
do
  for j in $(seq $y)
  do
    print_row="$print_row*"
  done
# if we reach the middle line (y=0) then exit the loop
  if [[ $y -eq 0 ]]; then
    y=4
    print_row=""
    break
  fi
  echo -n "$space_before$print_row"
  echo ""
  space_before="$space_before "
  print_row=""
  y=$[$y-2]
done

spaces=$[$x-2]
for i in $(seq $[$x-1])
do
space_before=""
if [[ $spaces -eq 0 ]]; then
  space_before=""
else
for k in $(seq $spaces)
do
  space_before="$space_before "
done
fi
spaces=$[$spaces-1]
for j in $(seq $y)
do
  print_row="$print_row*"
done
echo -n "$space_before$print_row"
print_row=""
echo ""
y=$[$y+2]
done


# #y=$[$x*2]
# #print bottom half
# for i in $(seq $x)
# do
# space_before=""
# for k in $(seq $[$x-$i])
# do
#   space_before="$space_before "
# done
#   if [[ $y -eq $[$x*2] ]]; then
#     break
#   fi
#   for j in $(seq $y)
#   do
#     print_row="$print_row*"
#   done
#   echo -n "$space_before$print_row"
#   echo ""
#   print_row=""
#   y=$[$y+2]
# done
# echo ""
# # for i in $(seq $[$x*2])
# # do
# #   echo -n "$space_before"
# #   for j in $(seq $y)
# #   do
# #     if [[ $y -eq 0 ]]; then
# #       continue
# #     fi
# #     echo -n "*"
# #   done
# #   y=$[$y-2]
# #   echo -n "$space_after"
# #   space_before="$space_before "
# #   space_after=" $space_after"
# #   echo ""
# # done
# # spaces=""
