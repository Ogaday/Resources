#!/bin/bash
readarray -t hosts < $1
readarray -t jobs < $2

extent=${#jobs[@]}

for ((i=0;i<$extent;++i)); do
    echo "Testing" "${jobs[i]}" "${hosts[i]}"
    echo $(~/Project/Resources/is-done.sh "${jobs[i]}" "${hosts[i]}")
    ~/Project/Resources/is-done.sh "${jobs[i]}" "${hosts[i]}" >> results.txt
done
