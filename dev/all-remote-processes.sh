#!/bin/bash

# For each host in hosts, counts the number of TInterfoam processes running.
# Takes the singular agurment: list of hosts. Can probably be run against host_master.txt most of the time.
# Could perhaps be combined with the one which shows the screens at a later point.

readarray -t hosts < $1

for ((i=0;i<${#hosts[@]};i++)); do echo ${hosts[i]}; ./is-remote-process.sh ${hosts[i]}; done
