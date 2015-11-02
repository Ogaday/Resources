#!/bin/bash
# script for renaming the case dirs in generation 2-8. To be run after renaming the generation dir to generationXY for instance. Renames from s-step-5-3 to 05.03 for instance. Does not work for cases higher thatn 09, unfortunately.

currdir=$(pwd)
genid=${currdir#*generation}

echo $gendi

for f in $(ls); do subf="${f:0:8}"; if [ "$subf" == "s-step${genid: -1}-" ]; then mv $f $genid.0${f:8}; fi; done
