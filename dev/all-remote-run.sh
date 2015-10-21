#!/bin/bash

readarray -t hosts < $1
readarray -t jobs < $2

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
done

