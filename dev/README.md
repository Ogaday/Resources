# CFD Scripts

This directory contains refactored of bash scripts used to run CFD simulations on remote hosts via ssh and screen. This second generation of scripts was developed by me (Ogaday) after running the initial batch of simulations. I believe it represents significant progress due in no small part to personal improvement in bash scripting and also familiarity with the process of running these simulations.

## Usage

### run.sh

```
    $ cd path/to/solution/dir 
    $ run.sh
```
OR to run solution 11 from generation 10, if the run directory is /scratch/wow203/OpenFOAM/wow203-2.1.0/run
```
    $ run.sh 10 11
```
OR to run solution 11 from generation 10 with in a specified run directory.
```
    $run.sh path/to/run/dir 10 11
```
