#!/usr/bin/env bash
echo -n "Enter file to cut: "
read file
cut -d":" -f2-4,6 $file
