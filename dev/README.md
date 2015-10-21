# CFD Scripts

This directory contains refactored of bash scripts used to run CFD simulations on remote hosts via ssh and screen. This second generation of scripts was developed by me (Ogaday) after running the initial batch of simulations. I believe it represents significant progress due in no small part to personal improvement in bash scripting and also familiarity with the process of running these simulations.

## Usage

### run.sh

```
    $ cd path/to/solution/dir 
    $ ./run.sh
```
OR to run solution 11 from generation 10, if the run directory is /scratch/wow203/OpenFOAM/wow203-2.1.0/run
```
    $ ./run.sh 10 11
```
OR to run solution 11 from generation 10 with in a specified run directory.
```
    $ ./run.sh path/to/run/dir 10 11
```
This command creates a detached screen with screen name ```screen<solid>``` for <solid>=10.11 for instance, and window name <solid>. It then sends a command to that screen to change directory to the case directory, run blockMesh, etc and finally the solver, logging output to log. The screen can be reattached by ```screen -r screen<solid>```, and should be killed once the simulation is complete - should be automated.

### remote-run.sh

``` $ ./remote-run.sh casepath genid solno remotehost ```
for local path to the case "casepath", generation id "genid", solution number "solno", remote host name "remotehost". This command copies the case files from the local path to the remote host to a default run directory via scp, and then calls run.sh as described above via ssh.

## remote-setup.sh
``` $ ./remote-setup.sh hostname```
for host name ie. blue03 "hostname", access the machine via ssh and start a screen in which to build and make the CFD solvers and utilities TInterfoam and swak4foam.

## To Do

Still to do:
 - Error checking/misuse scenarios. Currently, there is no sort of error checking, use case handling for when incorrect arguments are entered, the script is run in the wrong directory etc. Because the scripts are very powerful, it would be good to do some of that at some point because they could unleash havock.
 - Sniffer script. To run on each blue room machine. Logs the most recent users of each machine so it is possible to see who might have turned off the machines. (half joke).
 - All remote run script - to do batch remote runs of cases.
 - script to check which hosts are online. Currently, the best model I have is:
1) ```cp hosts_master.txt new_hosts.txt;```
2) ```for host in $new_hosts; do ssh wow203@$host "echo Hello $host"; done;```. When the script hangs, delete the offending host from new hosts
3) repeat step 2) until the script finishes.
 - Script to check capacity of remote hosts.
 - script to check progress of remotely running simulations.
