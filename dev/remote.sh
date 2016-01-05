#!/bin/bash

# The first argument must be the script to call remotely.
# The second argument must be the remote host on which to run the script.
# All proceeding arguments are passed to the remote script.
# This requires the script to be on the remote machine at a known location.

echo local
echo "$@"
echo ${@:3}

echo remote
ssh wow203@$2 Project/Resources/$1 ${@:3}
