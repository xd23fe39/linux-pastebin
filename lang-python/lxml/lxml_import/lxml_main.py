#!/usr/bin/env python
# Einfache Kontrollstrukturen

# Import 
from lxml import etree

# Baue ein XML-Dokument (DOM)
root = etree.XML('<root><a x="123">Text<b/><c/><b/></a></root>")

print("Ausgabe: " + root.find("a").tag)