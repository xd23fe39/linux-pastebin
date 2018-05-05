# MySQL Replication 

# Anmelden an MySQL
mysql -u root -p

# Binary Logfiles anlisten (aktuellere zuerst)
ls -lt /var/log/mysql | more

# Binary Log Items älter als 30 Tage löschen
PURGE BINARY LOGS BEFORE DATE(NOW() - INTERVAL 30 DAY) + INTERVAL 0 SECOND;

