#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-

# Prozeduren definieren und aufrufen

# Zeichenkette oder String (string)
text = "Umfang bei Durchmesser[cm]"

# Fließkommazahl oder Float pi (float, real)
pi = 3.1415

# Definition der Funktion/Prozedur 'umfang' mit Parameter 'd'
# für Durchmesser in Zentimeter.
def umfang(d):
    print("%s: %i, %f" % (text, d, d * pi))

# Aufruf der Funktion 'umfang' mit verschiedenen Parametern
umfang(7)
umfang(14)

# Prozeduren/Funktionen führen Konzepte ein für:
# - Modularisierung (Bausteine)
# - Wiederverwendbarkeit (Mehrfachaufruf)
