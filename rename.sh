#!/usr/bin/env bash
terms="Terms"
termsCut="cut -d'_' -f5 | cut -d'.' -f1"
summary="Summary"
summaryCut='cut -d"_" -f5 | cut -d"." -f1'
lesson="pptx"
lessonCut='cut -d"_" -f4'

for file in $(ls | grep -i $terms)
do
    number=$(echo $file | cut -d'_' -f5 | cut -d'.' -f1)
    mv $file "BE-Terms-$number.doc"
done
for file in $(ls | grep -i $summary)
do
    number=$(echo $file | cut -d'_' -f5 | cut -d'.' -f1)
    mv $file "BE-Summary-$number.doc"
done
for file in $(ls | grep -i $lesson)
do
    number=$(echo $file | cut -d"_" -f4)
    mv $file "BE-Lesson-$number.pptx"
done