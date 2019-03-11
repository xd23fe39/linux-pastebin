#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
# Einfache Kontrollstrukturen
# for ... range() und if ... else Kontrollstrukturen

# Variable für Summenbildung
sum = 0

# Wiederholung/Loop: hier wird mittels range() eine Zählerschleife implementiert
for i in range(0,5):
    print("for i in range(start, end): %i " % (i))

    # Bedingung: if/else
    if i > 0:
        if i % 2 == 0:
            print("   Zahl %i ist gerade!" % (i))
        else:
            print("   Zahl %i ist ungerade!" % (i))
    else:
        print("   Zahl ist NULL.")

    sum += i
    print("   Summe in Durchlauf %i: %i" % (i, sum))

