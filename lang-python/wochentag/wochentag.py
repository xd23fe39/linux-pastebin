# Python Script
#
# Anmerkungen zur Wochentagsunktion.
#
# Die eckige Klammer ist die Gaußklammer: 
# Sie gibt die größte ganze Zahl kleiner oder gleich x an. 
#
# https://de.wikipedia.org/wiki/Wochentagsberechnung
#
from math import *

# Eingabe
tag = 24
monat = 12
jahr = 2019

tage = ['So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa']

def get_wochentag(tag, monat, jahr):
  t = tag
  m = monat
  j = jahr
  c = floor(j / 100)
  y = j % 100
  print("Debug:", t, m, j, c, y)
  
  if (m < 3): 
    j = j - 1
  w = ((t + floor (2.6 * ((m + 9) % 12 + 1) - 0.2) + j % 100 + floor (j % 100 / 4) + floor (j / 400) - 2 * floor (j / 100) - 1) % 7 + 7) % 7 + 1;

  return w

# Hauptprogramm
wochentag = get_wochentag(tag, monat, jahr)
print ("Wochentag:", tage[wochentag])