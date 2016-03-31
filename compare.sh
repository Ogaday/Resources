#!/bin/bash
# Compare multiple files...Needs improving.
# $1 = name of file to compare

for f1 in `ls`; do
  for f2 in `ls`; do
    if [ -d $f1 -a -d $f2 ]; then
      echo $f1 $f2
      sdiff -s -W $f1/$1 $f2/$1
    fi
  done
done
