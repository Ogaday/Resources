# coding: utf-8
import os
import sys

'''if __name__ == "__main__":
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
            os.rename(e, gen + ".0" + e[-1])
        elif len(e)-len(old_name) == 2 and e[-1] == 'R':
            os.rename(e, gen+'.0'+e[-2:]
        elif len(e)-len(old_name) == 3 and e[-1] == 'R':
            os.rename(e, gen+'.'e[-3:]
        else:
            os.rename(e, gen+'.' + e[-2:])
            '''

if __name__ == "__main__":
    genid, old_name = sys.argv[1:3]

    for e in [entry for entry in [entry.name for entry in os.scandir()] if entry[:len(old_name)] == old_name]:
        #print(e)
        len_diff = len(e)-len(old_name)
        os.rename(e,genid+'.'+'0'*(2-len_diff)+e[-1*len_diff:])
