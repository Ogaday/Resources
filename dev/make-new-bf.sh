#!/bin/bash

# Args:
# name
# distances the same as
# new bfs

name=$1
distname=$2

echo $name
echo $distname

root_dir=~/Project/CFD_Files/generation
solid=${name#*.}
genid=${name%.$solid}

# echo $genid

dsolid=${distname#*.}
dgenid=${distname%.$dsolid}

# echo $dgenid

# Change the broken directory name
echo Rename broken file
mv $root_dir$genid/$name $root_dir$genid/${name}old

# Copy case with same distance files
echo Copy case with same distances
cp -r $root_dir$dgenid/$distname $root_dir$genid/

# Rename the distance file in the new place
echo Rename the new case files
mv $root_dir$genid/$distname $root_dir$genid/$name

# Manually change the bf values.
echo Now manually change bf values
vim $root_dir$genid/$name/constant/bodyForceDict
