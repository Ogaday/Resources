#!/bin/bash

host=$1
genid=$2
solno=$3

ssh wow203@$host "python /home/links/wow203/Project/Resources/postprocess.py $genid $solno"
scp wow203@$host:/scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation$genid/$genid.$solno/$genid.$solno.csv ~/Project/CFD_Files/results
