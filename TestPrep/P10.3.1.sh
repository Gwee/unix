#!/usr/bin/expect
set timeout 2
set city [lindex $argv 0]
set filename [lindex $argv 1]
file delete -force ${filename}
set Ctrl_u "\025"
set Save "\033fv"
log_user 0
spawn elinks www.timeanddate.com/worldclock/
log_user 1
expect "The World" {send "124\n"}
expect
expect * {send "\n${Ctrl_u}${city}\n"}
expect
expect * {send "y"}
expect
expect * {send "${Save}${Ctrl_u}./${filename}\n"}
expect
expect * {send "q"}
expect
expect * {send "y"}
expect