# find
man find
exit 0

# Lösche alle Dateien, die älter als 90 Tage sind (Action: -delete -exec command -ls -ok command )
find /var/log/mysql -mtime +90 -type f -delete

# Anlisten aller Dateien gem. FIND-Suchfilter 
find /tmp -name '*cpu*' -ls

# Zeigt eine Liste mit Dateien und Verzeichnissen die xxx im Namen enthalten
find /tmp -name "*xxx*"

# Zeigt eine Liste von Dateien mit xxx im Dateinamen
find /tmp -type f -name "*xxx*"
