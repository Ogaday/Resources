#!/bin/bash

# Greps the screen matching arg2 from the host matching arg1 to see if it's there.

ssh wow203@$1 screen -ls | grep $2
