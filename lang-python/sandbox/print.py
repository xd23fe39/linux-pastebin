#!/usr/bin/python
## -*- coding: utf-8 -*-

# Imports
import os
import math

# print/format demo
print('A little string with format placeholder for PI: {}.'.format(math.pi))
print('A little string with format placeholder for PI: {:5.4f}.'.format(math.pi))
print('A little string with format placeholder for PI: {:>15.4f}.'.format(math.pi))
print('A little string with format placeholder for PI: {:<15.4f}.'.format(math.pi))
print('A little string with format placeholder for PI: {:.>15.4f}. {:s} {}'.format(math.pi, "Hello", "Frank"))

text = "AaBbCcUuÜüOoÖöAaÄäß@"
print('Text Encoding Demo: {:s}'.format(text))
print('Text Encoding Demo: {}'.format(text.encode('utf-8')))

# Interactive input
d_in = float(input("Durchmesser: "))

# Calculate
print('Umfang bei D={}: {:<15.4f}.'.format(d_in,d_in*math.pi))
