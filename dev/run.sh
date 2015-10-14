#!/bin/bash
screen -R
blockMesh && topoSet && setsToZones && setFields && TInterFoam &> log &
screen -d

