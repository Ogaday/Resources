#!/bin/bash

# closes a screen on a remote host.
# arg1 is name of case ie. 13.01
# arg2 is remote host

ssh wow203@$2 "~/Project/Resources/dev/close-screen.sh $1"
