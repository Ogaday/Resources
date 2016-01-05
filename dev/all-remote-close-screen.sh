#!/bin/bash
# script to remotely close all of the screens that were used to run a batch.
# First arg is list of hosts
# Second arg is list of jobs

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
  echo "Closing ${jobs[i]} on ${hosts[i]}"
  ~/Project/Resources/dev/remote-close-screen.sh ${jobs[i]} ${hosts[i]}
done
