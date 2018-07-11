#!/usr/bin/env bash
echo -n "Enter number: "
read number
echo "I went to sleep for" $number" seconds at: "
date
sleep $number
echo "I woke up at: "
date
