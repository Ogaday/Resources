#!/bin/bash
# For given generations, rename the cases from the old naming convention, be it optsi or s-stepj-i to jj.ii

for ((i=0;i<9;++i)); do
  cd ~/Project/CFD_Files/generation0$i
  root=$(echo *1)
  root=${root%%1*}    #ie. slo or optslo or s-step4- etc.
  extent=${#root}
  for f in $(ls); do
    if [ "${f:0:$extent}"  == "$root" ]; then
      caseid=${f#*$root}    #ie 3 or 3_R
      stripped=${caseid%%_*}    #ie. just 3 or 11. No trailing _R
      if [ ${#stripped} -eq 1 ]; then
        caseid=0$caseid
      fi
      mv $f 0$i.$caseid
    fi
  done
done
