#!/usr/bin/expect
set timeout 15
set ip mars.netanya.ac.il
set user moyaguy
set password kcsh7694

spawn telnet $ip
expect "'^]'."
sleep .1;
send "\r";
expect {
  "login:"
  {
        send "$user\r"
        expect "Password:"
        send "$password\r";
        interact
  }

  "host: Connection refused"
  {
    send_user "ERROR:EXITING!"
    exit
  }
}
