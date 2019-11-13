#!/usr/bin/python
# 
# Python Script: executor.py
# Version 19.11.130
#
# Führt Befehle auf der Kommandozeile/Terminal aus. 

import os
import sys

# Kommandozeilenoptionen
OPTIONS = {
    '--help' : 'usage',
    '--ls' : 'ls',
    '--uname' : 'uname',
    '--pwd' : 'pwd',
    'EOL' : 'EOL'
}

#############################################################################
# Options 

def opt_uname():
    if os.name == 'nt':
        os.system('@echo %OS%')
    else:
        os.system('uname -a')

def opt_pwd():
    if os.name == 'nt':
        os.system('cd')
    else:
        os.system('pwd')

def opt_ls():
    if os.name == 'nt':
        os.system('dir')
    else:
        os.system('ls -l')

def opt_usage():
    print("EXECUTOR, Version 19.11.130\n")
    return 0

#############################################################################
# MAIN Procedure

def main():

    if (len(sys.argv) <= 1):
        opt_usage()
        opt_uname()
        opt_pwd()

    for arg in sys.argv:
        # print("ARG:",arg)
        if arg.startswith('--'):
            try:
                call_method = "opt_" + OPTIONS[arg] + "()"
                eval(call_method)
            except:
                print("Option ist nicht definiert! " + arg)
                exit(1)

    return 0

if __name__ == "__main__":
    main()

# EOF: PYTHON
