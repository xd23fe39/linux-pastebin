# Python Hilfsscript für die Zeichenkettenzerlegung
#

# Teilzeichenkette für Suche (Wortanfang)
SEARCH_PATTERN = "XXXX"

print("\nSearch Pattern: %s\n" % SEARCH_PATTERN)

##
# Parsen einer Zeile / Zeichenkette
#
def parser(line):
    lsize = len(line)
    print("Parser Input: %d chars\n" % (lsize))
    for i in range(lsize):
        smatch = line[i:i+3]                  # hole die nächsten 3 Zeichen aus line
        if smatch == SEARCH_PATTERN:          # suche nach Pattern. Falls gefunden, dann
            pstr = line[i:i+55]               # hole 55 Zeichen aus line nach pstr
            pos = pstr.index("<")             # suche nach Wort-Ende '<' (Position)
            tokken = pstr[0:pos]              # extrahiere das Tokken
            print("%s" % (tokken))        # und gebe es aus 

##
# Hauptprogramm
#
fobj = open("data.txt", "r")
for line in fobj:
    # print(line.rstrip())                    # Ausgabe einer Zeile aus der Datei fobj
    parser(line)                              # Line-Parser aufrufen
fobj.close()

