#!/usr/bin/env bash

for file in $(find /Users/guy/Desktop/C# -type f | grep -i .doc | tr -d ' ')
do
    
    subject=$(echo $file | cut -d"/" -f7| sed -e 's/[0-9][0-9]_//g')
    filename=$(echo $file | cut -d"/" -f8)
    cp $file /Users/guy/Desktop/COutput/$subject-$filename
    #echo $subject-$filename
done