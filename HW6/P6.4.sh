#!/usr/bin/env bash
web_addr='https://www.worldtimeserver.com/current_time_in_AU-NSW.aspx'
curl $web_addr >| tmp 2>&1
s=$(grep "Server Time:" tmp)
hours=$(echo $s | cut -d":" -f2)
minutes=$(echo $s | cut -d":" -f3)
ampm=$(echo $s | cut -d":" -f4 | cut -d" " -f2)
echo The time now at Sydney Australia is: $hours:$minutes $ampm