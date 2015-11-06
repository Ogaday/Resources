#!/bin/bash
# Script to remotely start a CFD simulation in a screen on a given host.
# Inputs are eg.
# casepath=/path/to/case/files
# genid=10
# solid=15
# remotehost=blue02

echo "args are $@"
args=("$@")
casepath=${args[0]}
genid=${args[1]}
solid=$genid.${args[2]}
remotehost=${args[3]}

echo "casepath is $casepath"
echo "genid is $genid"
echo "solid is $solid"
echo "remotehost is $remotehost"

ssh wow203@$remotehost "mkdir -p /scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation$genid/"
scp -r $casepath wow203@$remotehost:"/scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation$genid/"
ssh wow203@$remotehost "cd /scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation$genid/$solid && ~/Project/Resources/dev/run.sh $genid ${args[2]}"
