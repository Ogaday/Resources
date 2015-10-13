#!/bin/bash
# Execute this script on emps-smetana

for host in $(cat hosts.txt); do
  echo $host
done

readarray -t hosts < hosts.txt
readarray -t jobs < jobs.txt

#hosts=( "blue03" "blue04" )
#jobs=( "11.02" "11.03" )

echo "length hosts: ${#hosts[@]}"
echo "length jobs: ${#jobs[@]}"

if [ "${#jobs[@]}" -lt "${#hosts[@]}" ]; then
    echo "Length of jobs is shorter: ${#jobs[@]}"
    extent=${#jobs[@]}
else
    echo "Length of hosts is shorter: ${#hosts[@]}"
    extent=${#hosts[@]}
fi

for ((i=0;i<$extent;++i)); do
  echo "${hosts[i]} runs ${jobs[i]}"
  cp ~/Project/Resources/run.sh /scratch/wow203/CFD_Files/${jobs[i]}
  #if [ ! -a "/scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation${jobs[i]:0:2}/${jobs[i]}/run.sh" ]
  #  then
  #    scp -r /scratch/wow203/CFD_Files/${jobs[i]} ~/Project/Resources/run.sh wow203@${hosts[i]}:/scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation${jobs[i]:0:2}/${jobs[i]}/
  #else
    scp -r /scratch/wow203/CFD_Files/${jobs[i]} wow203@${hosts[i]}:"/scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation${jobs[i]:0:2}/${jobs[i]}"
  #fi
  ssh wow203@${hosts[i]} "cd /scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation${jobs[i]:0:2}/${jobs[i]} && blockMesh && topoSet && setsToZones && setFields && ./run.sh"
done
