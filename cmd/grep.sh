#!/usr/bin/env bash
#
# Suche nach bestimmter Zeichenkette in einer oder mehreren Dateien

# Einfacher Aufruf
grep 123 *.txt

# Nur die Zeilen, die die Zeichenkette apache2 enthalten, ausgeben
ps - ef | grep apache2 

# Suche via Regular Expression in mehreren Dateien
grep '^12.$' *.txt

# in Verbindung mit sed kann man auch Suchen/Ersetzen
grep '^12.$' *.txt | sed 's/123/555/'

# Suche Zeilen mit PHP, bringe diese in Listen-Form und zeige die Spalten 1 und 4 an
ps -e | echo $(grep php) | cut -d ' ' -f 1,4
