# coding: utf-8
import os

for e in [entry for entry in [entry.name for entry in os.scandir()] if entry[:6] == "s-step"]:
    if len(e) == 10:
        os.rename(e, "10.0" + e[-1])
    else:
        os.rename(e, "10." + e[-2:])
        
