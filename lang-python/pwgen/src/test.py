#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
# pwgen

# Importiere das randowm-Modul
import random

# Zeichenvorrat
pw_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890 ABCABCAB"

# Anzahl Zeichen in Zeichenvorrat
pw_chars_len = len(pw_chars)

# Generiere eine Zufallszahl
pw_random = random.randint(0,pw_chars_len - 1)

rand_char = pw_chars[pw_random];

def count_char(text, search):
    l = len(text)
    c = 0
    for i in range(0,l-1):
        if ( text[i] == search ):
            c += 1
    return c

# Ausgabe des Zeichenvorrats
print("Zeichenvorrat: %s (%i)") % (pw_chars, pw_chars_len)

# Ausgabe eines zufällig aus dem Zeichenvorrat ausgewählten Zeichens
print("Zufallszeichen: %s (%i)") % (rand_char, pw_random)

# Ausgabe, wie häufig ein Zeichen vorkommt
print("Zeichenprüfung: %i (%s)") % (count_char(pw_chars, rand_char), rand_char )

