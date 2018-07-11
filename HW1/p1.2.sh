#!/bin/bash
echo -n "Enter first number: "
read firstnumber
echo -n "Enter second number: "
read secondnumber
echo -n "Enter third number: "
read thirdnumber
if [ $firstnumber -ge $secondnumber ]; then
maxnumber=$firstnumber
else
maxnumber=$secondnumber
fi
if [ $thirdnumber -ge $maxnumber ]; then
maxnumber=$thirdnumber
fi
echo "The maximum of the three numbers "$firstnumber $secondnumber $thirdnumber "is:" $maxnumber
