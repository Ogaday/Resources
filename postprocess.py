# postprocess.py
# python 3.5
# Author: Ogaday
# Date: 2015/10/7

# File usage:
# In order to extract power and save in a .csv file named after the solution in
# the solution directory, type the following in the shell:
# $ python postprocesspy g s
# Where g is the generation number/name and s is the solution number/name

import sys
import os

runpath = "/scratch/wow203/OpenFOAM/wow203-2.1.0/run"
swak = "swakExpression_"
turbines = ["R1C1", "R2C1", "R2C2", "R3C1"]
cos = ["x", "z"]
dirs=['swakExpression_Fx_inR1C1', 'swakExpression_Fx_outR1C1',
      'swakExpression_Fx_inR2C1', 'swakExpression_Fx_outR2C1',
      'swakExpression_Fx_inR2C2', 'swakExpression_Fx_outR2C2',
      'swakExpression_Fx_inR3C1', 'swakExpression_Fx_outR3C1',
      'swakExpression_Fz_inR1C1', 'swakExpression_Fz_outR1C1',
      'swakExpression_Fz_inR2C1', 'swakExpression_Fz_outR2C1',
      'swakExpression_Fz_inR2C2', 'swakExpression_Fz_outR2C2',
      'swakExpression_Fz_inR3C1', 'swakExpression_Fz_outR3C1',
      'swakExpression_TR1C1v', 'swakExpression_TR2C1v',
      'swakExpression_TR2C2v', 'swakExpression_TR3C1v']

def get_generation_dir(generation):
    """
    Given a generation number, return the absolute reference to the generation directory.
    """
    #matches = [entry for entry in [entry.name.strip() for entry in os.scandir(runpath)] if entry[-1*len(generation):]==generation]
    #if len(matches) == 1:
    #    return runpath+matches[0]+'/'
    return runpath+"/generation"+generation

def get_solution_dir(generation_dir, sol):
    """
    Given the absolute reference to the generation directory and a solution number, return the absolute reference to the solution directory.
    """
    matches = [entry for entry in (entry.name.strip() for entry in os.scandir(generation_dir)) if entry[-1*len(sol):]==sol]
    if len(matches)==1:
        return generation_dir +"/"+ matches[0] + "/"
    else:
        raise Exception("Multiple solution directories: {}".format(matches))

def get_solution_name(generation_dir, sol):
    """
    Given the absolute reference to the generation directory and a solution number, return the absolute reference to the solution directory.
    """
    matches = [entry for entry in (entry.name.strip() for entry in os.scandir(generation_dir)) if entry[-1*len(sol):]==sol]
    if len(matches)==1:
        return matches[0]

def get_start_point(solution_dir):
    """
    Get the highest number title of the subdirectories in the swak directories.
    Pass to it runpath+gen_dir+"/"+sol_dir ie. /scratch/wow203/OpenFOAM/wow203-2.1.0/run/batch10/step8/
    """
    return max([int(entry.name.strip()) for entry in os.scandir(solution_dir+swak+"Fx_inR1C1")])


def extract_power(solution_dir):
    """
    Given the generation and sol of a case, check that the case a) exists b) has finished executing.
    Then find the timestep at which to seek from, then calculate the power extracted from each turbine.
    Finally, write the results to file/return the results.
    """
    pass
    powerdict = {}
    start = get_start_point(solution_dir)
    for turbine in turbines:
        powerdict[turbine] = sum([float(get_F_in(start, co, turbine, solution_dir))-float(get_F_out(start, co, turbine, solution_dir)) for co in cos])*float(get_T(start, turbine, solution_dir))
    # create dictionary of in forces, dictionary of out forces, dictionary of velocities
    # for each turbine, calculate power and store in powerdict
    return powerdict

def check_for_finish(solution_dir):
    """
    Given solution directory, check that the final timestep (7000) has been reached.
    """
    return "7000" in [entry.name.strip() for entry in os.scandir(solution_dir)]

def write_results(solution_dir, powerdict, filename):
    """
    Given the solution_dir and a dictionary of turbine:power, write the results to a single line csv file.
    """
    results = ''
    for turbine in turbines:
        results += str(powerdict[turbine]) + ','
    with open(solution_dir+filename+'.csv', 'w') as f:
        f.write(results[:-1])

def seek_last_line(file):
    """
    Take a file and return the last line in that file.

    See https://github.com/Ogaday/PyDoodles for alternatives and benchmarks. This seems to be the fastest
    method by some orders of magnitude.
    """
    with open(file, 'rb') as f:
        f.seek(-1024, os.SEEK_END)
        #This method reads "random.number\r\n" and the others "random.number\n". Something to do with the decoding.
        return f.readlines()[-1].decode().strip()

#These methods would perhaps be more elegant if I used a dictionary for the string arguments
def get_F_in(start, co, turbine, solution_dir):
    assert(co in cos)
    assert(turbine in turbines)
    #last_line = seek_last_line("solution_dir{}F{}_in{}/".format(swak, c, turbine))
    last_line = seek_last_line("{0}{1}F{2}_in{3}/{4}/F{2}_in{3}".format(solution_dir, swak, co, turbine, start))
    return last_line.split()[1]

def get_F_out(start, co, turbine, solution_dir):
    assert(co in cos)
    assert(turbine in turbines)
    last_line = seek_last_line("{0}{1}F{2}_out{3}/{4}/F{2}_out{3}".format(solution_dir, swak, co, turbine, start))
    #last_line = seek_last_line("solution_dir{}F{}_out{}/".format(swak, c, turbine))
    return last_line.split()[1]

def get_T(start, turbine, solution_dir):
    assert(turbine in turbines)
    last_line = seek_last_line("{0}{1}T{2}v/{3}/T{2}v".format(solution_dir, swak, turbine, start))
    #last_line = seek_last_line("{}T{}v/".format(swak, turbine))
    return last_line.split()[1]

def get_val(dir):
    last_line = seek_last_line(dir)
    return last_line.split()[1]

def write_vals(solution_dir, filename):
    vals = []
    start=get_start_point(solution_dir)
    for d in dirs:
        val.append(get_val(d+"/"+start+"/"+d[15:]))
    with open(solution_dir+filename+'raw.csv', 'w') as f:
        f.write(','.join(vals))

helpstring="""Postprocess information
Usage:
    $ python postprocess.py -h  -  displays this help message and exits
    $ python postprocess.py 10 18  -  for instance calculates the power
    extracted for case 10.18 if 10.18 is on the standard path
    ie './scratch/wow203/OpenFOAM/wow203-2.1.0/run/generation10'.
    $ python postprocess.py 10 18 /alternative/run/path calculates the power
    whent he case is in another location.
    $ python postprocess.py 10 18 -v writes the verbose results to a file.
"""
if __name__ == "__main__":
    # parse argument from the commandline / system.
    if '-h' in sys.argv:
        print(helpstring)
    else:
        if '-v' in sys.argv:
            verbose=True
            sys.argv.remove('-v')
        else:
            verbose=False
        gen_arg, sol_arg = sys.argv[1:3]
        if len(sys.argv) == 4:
            runpath = sys.argv[-1]
            while runpath[-1] == '/' and len(runpath)>1:
                runpath=runpath[:-1]
        generation_dir = get_generation_dir(gen_arg)
        print(generation_dir)
        solution_dir = get_solution_dir(generation_dir, sol_arg)
        print(solution_dir)
        if check_for_finish(solution_dir):
            if verbose:
                write_vals(solution_dir, get_solution_name(generation_dir, sol_arg))
            else:
                write_results(solution_dir, extract_power(solution_dir), get_solution_name(generation_dir, sol_arg))
