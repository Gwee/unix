#!/usr/bin/env expect
file delete -force tmp
#set timeout 2
set city [lindex $argv 0]
set Alt ”\033”
set Ctrl_u ”\025”
spawn elinks http://www.checktimes.com/
sleep 3
expect ”Current” {send ”9\n”}
expect ”Value” {send ”\nNetanya\n”}
expect ”form” {send ”\n”}
sleep 4
#Pressing alt then v opens save to file dialog in eLinks and then we call it tmp 
expect ”Time” {send ”${Alt}fvtmp\n”}
expect * {send ”q”}
expect * {send ”y”}
expect
