#!/bin/bash
for host in $(cat hosts.txt); do
  echo $host
done

readarray -t hosts < hosts.txt
readarray -t jobs < jobs.txt

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
done
