#!/bin/bash

# Takes one argument: the name of the remote host

ssh wow203@$1 "ps aux" | grep TInterFoam
