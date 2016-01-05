#!/bin/bash

# For all hosts and cases in args $2 and $3 execute the script in $1 with the remaining args appended.

readarray -t hosts < $2
readarray -t jobs < $3

echo "length hosts: ${#hosts[@]}"
echo "length jobs: ${#jobs[@]}"

if [ "${#jobs[@]}" -le "${#hosts[@]}" ]; then
  echo "Length of jobs is shorter: ${#jobs[@]}"
  extent=${#jobs[@]}
else
  echo "Length of hosts is shorter: ${#hosts[@]}"
  extent=${#hosts[@]}
fi

for ((i=0;i<$extent;i++)); do
  echo ./remote.sh $1 ${hosts[i]} ${jobs[i]} ${@:4}
  ./remote.sh $1 ${hosts[i]} ${jobs[i]} ${@:4}
done
