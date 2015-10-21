#!/bin/bash

readarray -t hosts < $1
readarray -t jobs < $2
if [ "$3" == "" ]; then
  echo foo
  casesdir=/home/ogaday/Project/CFD_Files
else
  echo bar
  casedir=$3
  casesdir=${casedir%/}
fi
echo casesdir is $casesdir

echo "length hosts: ${#hosts[@]}"
echo "length jobs: ${#jobs[@]}"

if [ "${#jobs[@]}" -le "${#hosts[@]}" ]; then
    echo "Length of jobs is shorter: ${#jobs[@]}"
    extent=${#jobs[@]}
else
    echo "Length of hosts is shorter: ${#hosts[@]}"
    extent=${#hosts[@]}
fi

for ((i=0;i<$extent;++i)); do
  # echo "${hosts[i]} runs ${jobs[i]}" >> ~/Project/CFD_Files/jobtraq.txt
  echo "${hosts[i]} runs ${jobs[i]}"
  solno=${jobs[i]#*.}
  genid=${jobs[i]%.$solno}
  casepath="$casesdir/generation$genid/${jobs[i]}"
  echo "casepath: $casepath"
  echo "gen id: $genid"
  echo "solution no.: $solno"
  echo "remote host: ${hosts[i]}"
  #./remote-run.sh /home/ogaday/Project
done
