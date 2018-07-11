#!/usr/bin/env bash
set +C
echo -n "Enter program name: "
read program
chmod +x $program
echo -n "Enter file name: "
read file
./$program 2&>$file
output=""
while read line; do
  if [[ $output = "" ]]; then
    output="${line}\n${line}"
  else
  output="${output}\n${line}\n${line}"
fi
done < $file
echo -e $output >| $file
