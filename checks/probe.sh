#!/bin/sh
# The login page answers wrong credentials with its message.
curl -fsS --max-time 10 -d 'username=nobody&password=probe' http://web:5003/login | grep -q 'Invalid credentials'
