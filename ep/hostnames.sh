INFILE="infile.txt"
PRE="abc"

# Hole alle Hostnamen mit PRE im Namen aus INFILE und entferne überschüssige Spalten
grep $PRE $INFILE | cut -d '@' -f 2 | cut -d "'" -f 1 | cut -d ' ' -f 1 >> $INFILE.out

# Ersetze alle Zeilen mit 'alias' durch '---'
sed 's/alias/---/' $INFILE.out >> $INFILE.out1 

# Ausgabe der Art HOSTNAME IPADDRESS 
for i in $(cat $INFILE.out1); do if [ $i != '---' ]; then echo -n $i " "; nslookup $i | grep Address | tail -1 | cut -d ' ' -f 2; fi; done;
