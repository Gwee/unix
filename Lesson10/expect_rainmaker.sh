#!/usr/bin/env expect
set city [lindex $argv 0]
log_user 0
spawn telnet rainmaker.wunderground.com
expect ”Process Return to Continue:” {send ”\n”}
expect ”city code” {send ”$city\n”}
log_user 1
expect ”exit” {send ”x\n”}
expect ”x” {exit}
