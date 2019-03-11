#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
#
# Quellen:
# https://docs.python.org/2/library/csv.html

import csv as csv
import os as os

# Aktuelles Verzeichnis
current_dir = os.getcwd()

# Ort des Skriptes (__file__)
script_dir = os.path.dirname(os.path.realpath( __file__ ))

input_file="../data/testdaten.csv"
output_file="../data/output.tmp"

with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
    for line in infile:
        print("  %s --: " % line.strip("\n"))
        outfile.write(line)