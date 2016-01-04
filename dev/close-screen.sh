#!/bin/bash

# close a screen for a case, which is the first argument.

screen -X -S screen$1 quit
