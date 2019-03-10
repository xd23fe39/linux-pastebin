
# Einfaches Array
ZAHLEN=(0 1 2 3 4 5 6 7 8 9)

# Alle Elemente eines Arrays anzeigen
echo ${ZAHLEN[*]}

# Anzeigen des 5. Elements (beginnt bei null)
echo ${ZAHLEN[5]}

# Element eines Arrays einen Wert zuweisen
ZAHLEN[5]=five

# Anzahl der Einträge eines Arrays
echo ${#ZAHLEN[*]}

# Neues Array mit den 5 Elementen ab Position 2 aus altem Array bilden 
echo ${ZAHLEN[*]:2:5}

# Loop über alle Elemente eines Arrays
for z in ${ZAHLEN[*]}; do echo $z; done

# Loop über 3 Einträge, startet ab Eintrag 2
for z in ${ZAHLEN[*]:2:3}; do echo $z; done

# Declariere LISTE als assoziatives Array
declare -A LISTE

# Wertezuweisung 
LISTE['Name']=Linux
LISTE['Wert']=Debian

# Zeigt den Wert für Eintrag 'Name'
echo ${LISTE['Name']}

# Zeigt alle Werte des assoziativen Arrays
echo ${LISTE[*]}
