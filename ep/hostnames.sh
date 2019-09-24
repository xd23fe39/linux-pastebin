INFILE="infile.txt"
PRE="abc"

# Hole alle Hostnamen mit PRE im Namen aus INFILE und entferne überschüssige Spalten
grep $PRE $INFILE | cut -d '@' -f 2 | cut -d "'" -f 1 | cut -d ' ' -f 1 >> $INFILE.out

# Ersetze alle Zeilen mit 'alias' durch '---'
sed 's/alias/---/' $INFILE.out >> $INFILE.out1 

