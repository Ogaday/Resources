#!/bin/bash
args=("$@")
argnum=${#args[@]}

rundir=/scratch/wow203/OpenFOAM/wow203-2.1.0/run

if [ $argnum -eq 0 ]; then
  soldir=$PWD
elif [ $argnum -eq 2 ]; then
  soldir="$rundir/generation${args[0]}/${args[0]}.${args[1]}"
elif [ $argnum -eq 3 ]; then
  rundir=${args[0]}
  soldir="$rundir/generation${args[1]}/${args[1]}.${args[2]}"
fi
solid=${soldir#*generation*/}
echo "solution dir is $soldir"
echo "solution id is $solid"

screen -d -m -S "screen$solid" -t "$solid"
#screen -S "screen$solid" -p "$solid" -X stuff "cd $soldir && touch screen_touch_$solid.txt$(printf \\r)"
#screen -S "screen$solid" -p "$solid" -X stuff "echo \"solution dir is $soldir\"$(printf \\r)"

# One method, for instance:
# screen -d -m -S test_screen
# screen -S test_screen -p 0 -X stuff "sleep 5 && touch ~/Project/Resources/dev/hello_world && sleep 1$(printf \\r)"

screen -S "screen$solid" -p "$solid" -X stuff "cd $soldir && blockMesh && topoSet && setsToZones && setFields && TInterFoam &> log &$(printf \\r)"
