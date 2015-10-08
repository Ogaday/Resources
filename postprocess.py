# postprocess.py
# python 3.5
# Author: Ogaday
# Date: 2015/10/7

# File usage:

import sys
import os

runpath = "/scratch/wow203/OpenFOAM/wow203-2.1.0/run/"
turbines = ["R1C1", "R2C1", "R2C2", "R3C1"]

def get_sol_dir(generation, sol):
    """Assert existence of case g.sol"""
    matches = [entry for entry in (entry.name.strip() for entry in os.scandir(runpath)) if entry[-1*len(generation):]==generation]
    #assert(len(matches==1))
    if len(matches) == 1:
        gen_dir = matches[0]

        matches = [entry for entry in (entry.name.strip() for entry in os.scandir(runpath+gen_dir)) if entry[-1*len(sol):]==sol]
        if len(matches==1):
            sol_dir = matches[0]

            return (gen_dir, sol_dir)

def extract_power(generation, sol):
    """
    Given the generation and sol of a case, check that the case a) exists b) has finished executing.
    Then find the timestep at which to seek from, then calculate the power extracted from each turbine.
    Finally, write the results to file/return the results.
    """
    gen_sol_dir = get_sol_dir(generation, sol)
    if gen_sol_dir:
        pass


if __name__ == "__main__":
    # parse argument from the commandline / system.
    gen_arg, sol_arg = tuple(sys.argv[1:3])
    print(gen_arg, sol_arg)
    pass