#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
# A simple Password Generator (pwgen)

# Importiere das randowm-Modul
import random

# Zeichenvorrat
pw_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"

# Anzahl Zeichen in Zeichenvorrat
pw_chars_len = len(pw_chars)

# Generiere eine Zufallszahl

def count_char(text, search):
    l = len(text)
    c = 0
    for i in range(0,l-1):
        if ( text[i] == search ):
            c += 1
    return c

def rand_char():
    i = random.randint(0,pw_chars_len - 1)
    return pw_chars[i] 

def rand_generate(pw_len):
    buf = ""
    for i in range(0,pw_len):
        buf += rand_char()
    return buf

def print_block(pw_size):
    print("--- BEGIN: BLOCK");
    for i in range(0, 12):
        print("%s") % (rand_generate(pw_size))
    print("--- END: BLOCK\n");

# Ausgabe des Zeichenvorrats
print("\n--- GET: CHARSET\n%s (%i)\n") % (pw_chars, pw_chars_len)

# Ausgabe eines zufällig aus dem Zeichenvorrat ausgewählten Zeichens
print("--- GET: PASSPHRASE\n%s\n") % (rand_generate(12))

# Blockausgabe
print_block(12)
