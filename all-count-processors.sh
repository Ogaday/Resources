#!/bin/bash

#counts of the processors of each host in host_master.txt

readarray -t master < host_master.txt

for ((i=0;i<${#master[@]};i++)); do echo ${master[i]}; ssh wow203@${master[i]} "lscpu" | grep "^CPU(s):"; done
