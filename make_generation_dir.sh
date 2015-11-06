#!/bin/bash

for ((i=0;i<${#hosts[@]};++i)); do ssh wow203@${hosts[i]} mkdir -p /scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation09; done
