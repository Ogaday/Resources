#!/bin/bash
# Script to ascertain if a case has finished processing by checking for the 7000th time step. Here goes!

# positional args: $1 = case name, ie. 10.18. $2 = hosts name ie. blue15

found=$(ssh wow203@$2 "if [ -a /scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation${1%.*}/$1/7000 ]; then echo 1; else echo 0; fi")

echo $found
