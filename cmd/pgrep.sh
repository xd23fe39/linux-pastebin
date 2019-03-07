
# Zeigt alle Prozesse an mit PID und Name oder in Langform mit -a
pgrep -l '.*'

# Zeige alle Prozesse, deren Name mit systemd beginnen
pgrep -l '^systemd.*'

# Zeige den Prozess mit dem Namen systemd 
pgrep -l '^systemd$'

# Zeige alle Prozesse der Form name-name mit Bindestrich im Prozessname
pgrep -l '^([a-z])\w+(\-+)(\w+)$'

# Zeige nur Prozessname aus Spalte 2 ohne PID aus Spalte 1
pgrep -l '^([a-z])\w+(\-+)(\w+)$' | cut -d ' ' -f 2

# Vertausche Spalte 2 Prozessname und PID 
pgrep -l '^([a-z])\w+(\-+)(\w+)$' | awk -F ' ' '{} END { printf("%s - %s\n", $2,$1); }'

# Mit Zeilennummerierung
pgrep -l '^([a-z])\w+(\-+)(\w+)$' | awk -F ' ' 'BEGIN { pos=1;} { printf("%3d | %20s | %s\n", pos, $2,$1); pos++;}'
