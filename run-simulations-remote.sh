#!/bin/bash
# Execute this script in a screen so it can be detached

for host in $(cat hosts.txt); do
  echo $host
done

#readarray -t hosts < hosts.txt
#readarray -t jobs < jobs.txt

hosts=( "blue01" "blue02" )
jobs=( "09.04R" "09.10R" )

echo "length hosts: ${#hosts[@]}"
echo "length jobs: ${#jobs[@]}"

if [ "5" -lt "10" ]; then
	echo "True!"
fi

if [ "${#jobs[@]}" -lt "${#hosts[@]}" ]; then
    echo "Length of jobs is shorter: ${#jobs[@]}"
    extent=${#jobs[@]}
else
    echo "Length of hosts is shorter: ${#hosts[@]}"
    extent=${#hosts[@]}
fi

for ((i=0;i<$extent;++i)); do
  echo "${hosts[i]} runs ${jobs[i]}"
  scp /scratch/wow203/CFD_Files/${jobs[i]} wow203@${hosts[i]}:"/scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation${jobs[i]:0:2}/${jobs[i]}"
  ssh wow203@${hosts[i]} cd "/scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation${jobs[i]:0:2}/${jobs[i]}" && blockMesh && topoSet && setsToZones && setFields && TInterfoam &> log &  
done
