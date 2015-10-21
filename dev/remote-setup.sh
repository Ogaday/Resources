#!/bin/bash
echo $1
ssh wow203@$1 "screen -m -d -S making && screen -S making -X stuff \"~/Project/cfd_scripts/foams-setup.sh$(printf \\r)\""
