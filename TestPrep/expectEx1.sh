#!/usr/bin/expect
log_user 0
spawn /workspace/Unix/TestPrep/guy.sh
log_user 1
expect "Enter" {send "10\n"}
expect "Enter" {send "30\n"}
expect "The" {exit}