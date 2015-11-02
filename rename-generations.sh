#!/bin/bash
# script for renaming case generations from s-step3 to generation03 for instance. Does not work for generations high that 09 unfortunately.

for f in $(ls); do if [ "${f:0:6}" == "s-step" ]; then mv $f generation0${f:6}; fi; done
