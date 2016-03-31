#!/bin/sh
####################################
#
# Setup OpenFOAM to use on ubuntu machine.
# Project directory will be /scratch/wow203/OpenFOAM/
# Makes sure Project dir exists.
# Copies TInterfoam from U: drive to Project directory
# Copies swak4foam from U: drive to Project directory
# Makes TInterfoam
# Makes swak4foam
# Copies additional shared object libraries to $FOAM_USER_LIBBIN
#
# In $HOME I have 
#
####################################

# Ensure working directory exists and copy solvers.
cd ~
mkdir -p /scratch/wow203/OpenFOAM/wow203-2.1.0/applications/solvers
cp -r Project/TInterFoam/ /scratch/wow203/OpenFOAM/wow203-2.1.0/applications/solvers/
if [ ! -d /scratch/wow203/OpenFOAM/wow203-2.1.0/swak4foam ]
    then
        cp -r Project/swak4foam/ /scratch/wow203/OpenFOAM/wow203-2.1.0/
fi


# Make swak4faom
cd /scratch/wow203/OpenFOAM/wow203-2.1.0/swak4foam/
./Allwclean
./Allwmake &> log &
./Allwmake &> log &

# Make TInterfoam
cd /scratch/wow203/openFOAM/wow203-2.1.0/applications/solvers/TInterfoam
wclean
wmake &> log &
wmake &> log &

# Copy .so files to libbin
cp ~/Project/mgg204-log/*.so $FOAM_USER_LIBBIN