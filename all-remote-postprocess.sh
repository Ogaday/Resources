#!/bin/bash
readarray -t hosts < $1
readarray -t jobs < $2

extent=${#jobs[@]}

for ((i=0;i<$extent;++i)); do
  solno=${jobs[i]#*.}
  genid=${jobs[i]%.$solno}
  echo "Collecting $genid.$solno from ${hosts[i]}"
  /home/ogaday/Project/Resources/remote-postprocess.sh "${hosts[i]}" "$genid" "$solno"
done
