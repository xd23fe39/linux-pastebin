#!/usr/bin/python
## -*- coding: utf-8 -*-

# Import basic modules
import os
import sys

# Initialization
I_WORKING_DIR = os.getcwd()
I_GETENV_USER = os.getenv("USER")
I_SYS_SCRIPTNAME = sys.argv[0]

##########################################################################
# Basic Operations

def code():
    pass

def build():
    pass

def deploy():
    pass

##########################################################################
# MAIN Procedure

if __name__ == "__main__":
    pass

print("Current working directory: {:s}".format(I_WORKING_DIR))
print("Current user name: {:s}".format(I_GETENV_USER))

try:
    oper = "" + sys.argv[1] + "()"
    print("Operation: {}".format(oper))
    eval(oper)
    exit(0)
except NameError:
    print("Operation nicht gefunden.".format(sys.argv[1]))
finally:
    print("Completed.")

