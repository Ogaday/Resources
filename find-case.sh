#!/bin/bash
# positional args: $1 = case name, ie. 10.18. $2 = hosts list ie. host_master.txt

# There has to be a better way of doing this... - number of args
args=("$@")
argnum=${#args[@]}

if [ $argnum -ge 2 ]; then host_list=$2; else host_list=host_master.txt; fi

found=0    #boolean

#for host in $(cat $host_list); do echo "checking host $host"; ssh wow203@$host "if [ -a /scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation10/$1 ]; then echo \"found=1\"; loc=$host; echo \"case $1 is on $host\"; fi"; done

for host in $(cat $host_list); do
  echo "checking host $host"
  if found=$(ssh wow203@$host "if [ -a /scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation${1%.*}/$1 ]; then echo 1; else echo 0; fi"); then
   :
  else
    found=-1
  fi
  if [ "$found" -eq 1 ]; then
    echo "Found case $1 on host $host!"
    loc=$host
    found=0
  elif [ "$found" -eq -1 ]; then
    echo "Host $host unresponsive"
  else
    echo "Not on $host"	  
  fi
done

if [ "$loc" != "" ]; then echo "Found $1! On host $loc"; else echo "Not found"; fi
