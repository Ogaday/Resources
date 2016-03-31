#!/bin/bash
#Script that takes the head and tail of 08.01/0/alpha1 and compares it with the whole of 08.01/0/alpha1.Org

mkfifo pipe
# concatenate head and tail of alpha1 and puts it in a named pipe.
cat <(head -n 21 08.01/0/alpha1) <(tail -n 43 08.01/0/alpha1) > pipe &
# feed the named pipe and a process substition pushing out alpha1.Org to sdiff (ignoring whitespace)
sdiff -W <(cat pipe) <(cat 08.01/0/alpha1.Org)
rm pipe
