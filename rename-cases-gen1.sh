#!/bin/bash

currdir=$(pwd)
genid=${currdir#*generation}
echo $genid

for f in $(ls)
  do subf=${f:0:6}
  if [ "$subf" == "optslo" ]
    then temp=${f:6}; temp=${temp%%_*}
    if [ ${#temp} -eq 1 ]
      then mv $f $genid.0${f:6}
    else
      mv $f $genid.${f:6}
    fi
  fi
done
