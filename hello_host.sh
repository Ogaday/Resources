#!/bin/bash
# Tests the connection to each host in host_master.txt
for host in $(cat host_master.txt); do ssh wow203@$host echo Hello $host; done
