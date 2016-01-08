#!/bin/bash

# takes hosts file and jobs files as argument

readarray -t hosts < $1
readarray -t jobs < $2

if [ ${#hosts[@]} -le ${#jobs[@]} ]; then extent=${#hosts[@]}; else extent=${#jobs[@]}; fi

for ((i=0;i<$extent;i++)); do echo ${hosts[i]} running ${jobs[i]}; ssh wow203@${hosts[i]} "ls /scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation${jobs[i]%.*}/${jobs[i]} | grep -v swak | grep -v constant | grep -v log | grep -v system" | tail -n 1; done
