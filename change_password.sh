#!/usr/bin/expect

spawn passwd [lindex $argv 0]
expect "*password:"
send [lindex $argv 1]\r
expect "*password:"
send [lindex $argv 1]\r
expect eof
