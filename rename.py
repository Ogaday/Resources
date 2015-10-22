# coding: utf-8
import os
import sys

if len(sys.argv) == 1:
    old_name=sys.argv[1]
elif len(sys.argv) == 2:
    old_name=sys.argv[1]
    gen = sys.argv[2]
else:
    old_name="s-step"
    gen="10"

    

for e in [entry for entry in [entry.name for entry in os.scandir()] if entry[:len(old_name)] == old_name]:
    
    if len(e)-len(old_name) == 1:
        os.rename(e, gen+'.0' + e[-1])
    elsif len(e)-len(old_name) == 2 and e[-1] == 'R':
        os.rename(e, gen+'.0'+e[-2:]
    elsif len(e)-len(old_name) == 3 and e[-1] == 'R':
        os.rename(e, gen+'.'e[-3:]
    else:
        os.rename(e, gen+'.' + e[-2:])
        
