# extract_power.py
# python 3.4.3
# Author: Ogaday
# Date: 2015/10/7

# Assume we are the sample directory for now, path can be changed later.

import os

def calc_power(fx_in, fx_out, fy_in, fy_out, T):
    return (fx_in-fx_out+fy_in-fy_out)*T

def seek_last_line(file):
    """
    Take a file and return the last line in that file.
    
    See https://github.com/Ogaday/PyDoodles for alternatives and benchmarks.
    """
    with open(file, 'rb') as f:
        f.seek(-1024, os.SEEK_END)
        #This method reads "random.number\r\n" and the others "random.number\n". Something to do with the decoding.
        return f.readlines()[-1].decode().strip()
    
def get_log_file(name):
    """
    given a name for a variable, 
    """

def starting_point():
    """
    Return the second number at which the simulation was most recently started, so that the directory containing the final bit of of the simulation can be found.
    
    Could think of another name for this. Time step?
    """
    return max([int(entry.name.strip()) for entry in os.scandir("/swakExpression_Fx_inR1C1")])

values = [e for e in [entry.name.strip() for entry in os.scandir("/swakExpression_Fx_inR1C1")] if e[:4] == "swak"]


# Questions: arguments for get_log_file_name? structure of program? Where is granularity?