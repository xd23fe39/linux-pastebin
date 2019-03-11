#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
#

# Eingabeaufforderung zur Eingabe von alphanumerischen Zeichen
name = raw_input("Your name: ")

# Eingabe wird von Python-Interpreter interpretiert (keine Texteingabe)
code = input("Test Python code '6*7': ")

# Ergebnis der Interpretation 
print "Output: %s; user: %s" % (code, name)
