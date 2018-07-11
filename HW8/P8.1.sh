#!/usr/bin/env bash
sed -e "/$1/d" -e 's/\([^ ]\+\)[ ]*$/\1 \1 \1/' $2












