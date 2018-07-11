#!/usr/bin/env bash
echo -n "Enter file or directory names: "
read items
file_size=""
for item in $items
do
  if [[ -f $item ]]; then
    for i in $(seq 10) #TODO: this can be done easier by doing wc -c > $item
    do
      file_size=$(wc -c $item | cut -d" " -f$i)
      if [[ -n $file_size ]]; then
        break
      fi
    done
  echo "$item is a regular file of size $file_size"
  continue
  fi
  if [[ -d $item ]]; then
    echo "$item is a directory"
    continue
  fi
  echo "$item is not a file or directory"
done
