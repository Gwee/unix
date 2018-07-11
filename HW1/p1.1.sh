#!/bin/bash
echo -n "Enter first file name: "
read firstfilename
echo -n "Enter second file name: "
read secondfilename
echo "Beginning of first file" $firstfilename 
cat $firstfilename
echo -e "End of first file" $firstfilename "\n"
echo "This is the second file" $secondfilename
cat -n $secondfilename