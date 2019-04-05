# find
man find
exit 0

# Lösche alle Dateien, die älter als 90 Tage sind
find /var/log/mysql -mtime +90 -type f -delete

# Suche nach Datei
find /tmp -name "*xxx*"
