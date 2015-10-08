# Resources

Resource ball for the automation fo CFD simulations on remote linux machines on the uni network. To contain python scripts, other resources such as template for OpenFoam cases. This repo can then be cloned into a shared eare on each machine and be used to set up the work environment.

I don't have root access to these machines. They have anaconda/conda python, OpenFoam-2.1.0, screen, git, installed and I have ssh access.

Tools I will use: Python=3.5, screen, remote automation tools: Fabric / Ansible / Rex. bash. Git.

## Use Cases

Simple automation firstly:
 - Setting up working directory, installation of swak4foam, solver(TInterfoam).
 - Preprocessing to create the necesary files (dicts) to run the simulation, set up up the directories.
 - Run OpenFoam scripts (blockMesh etc), run simulation in remote screens and detach.
 - Track progress of running simulations, display progress, location. Notify if simulations are failed/finished.
 - Postprocess, extract power, collect results.
Eventually have enough tools to automate a genetic algorithm etc. optimisation algorithm running remotely.

## To Do

 - Write scripts.
 - Decide on directory structure (python module necessary?).
 - Create case template.
 - Write test suite for the scipts.