# postprocess.py
# python 3.5
# Author: Ogaday
# Date: 2015/10/7

# File usage:

import sys
import os

runpath = "/scratch/wow203/OpenFOAM/wow203-2.1.0/run/"
swak = "/swakExpression_"
turbines = ["R1C1", "R2C1", "R2C2", "R3C1"]
cos = ["x", "y"]

def get_solution_dir(generation, sol):
    """Assert existence of case g.sol"""
    matches = [entry for entry in (entry.name.strip() for entry in os.scandir(runpath)) if entry[-1*len(generation):]==generation]
    #assert(len(matches==1))
    if len(matches) == 1:
        gen_dir = matches[0]

        matches = [entry for entry in (entry.name.strip() for entry in os.scandir(runpath+gen_dir)) if entry[-1*len(sol):]==sol]
        if len(matches)==1:
            sol_dir = matches[0]

            return runpath+gen_dir+ "/" + sol_dir + "/"

def get_start_point(solution_dir):
    """
    Get the highest number title of the subdirectories in the swak directories.
    Pass to it runpath+gen_dir+"/"+sol_dir ie. /scratch/wow203/OpenFOAM/wow203-2.1.0/run/batch10/step8/
    """
    return max([int(entry.name.strip()) for entry in os.scandir(solution_dir+swak+"Fx_inR1C1")])


def extract_power(generation, sol):
    """
    Given the generation and sol of a case, check that the case a) exists b) has finished executing.
    Then find the timestep at which to seek from, then calculate the power extracted from each turbine.
    Finally, write the results to file/return the results.
    """
    gen_sol_dir = get_solution_dir(generation, sol)
    if gen_sol_dir:
        pass

def seek_last_line(file):
    """
    Take a file and return the last line in that file.
    
    See https://github.com/Ogaday/PyDoodles for alternatives and benchmarks.
    """
    with open(file, 'rb') as f:
        f.seek(-1024, os.SEEK_END)
        #This method reads "random.number\r\n" and the others "random.number\n". Something to do with the decoding.
        return f.readlines()[-1].decode().strip()

def get_F_in(start, co, turbine, solution_dir):
    assert(co == "x" or co == "y")
    assert(turbine in turbines)

def get_F_out(start, co, turbine, solution_dir):
    assert(co == "x" or co == "y")
    assert(turbine in turbines)

def get_T(start, turbine, solution_dir):
    assert(turbine in turbines)

if __name__ == "__main__":
    # parse argument from the commandline / system.
    gen_arg, sol_arg = tuple(sys.argv[1:3])
    print(get_solution_dir(gen_arg, sol_arg))
    
