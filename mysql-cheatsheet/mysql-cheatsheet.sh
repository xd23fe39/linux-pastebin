# MySQL use mysql-client on a bash
exit 1

# Auf entferntem Rechner anmelden

ssh pi@host                             # Anmelden auf user@syncbox
sudo su -                               # als root-Benutzer anmelden

# Logon with mysql-client

mysql                                   # mysql-client aufrufen
mysql -u user -p                        # mysql-client mit User/Password aufrufen
                                        # beenden mit `\q`
sudo mysqlshow                          # MySQL Datenbanken anzeigen (root-Kontext)
sudo mysqlshow -u user -p               # MySQL Datenbanken anzeigen (user-Kontext)

# MySQL mysqladmin-Tool
# Usage: mysqladmin [OPTIONS] command command....

mysqladmin status                       # Statusabfrage mit aktuellem Benutzer

# mysqladmin: connect to server at 'localhost' failed
# error: 'Access denied for user 'pi'@'localhost' (using password: NO)'

mysqladmin version                      # MySQL Version anzeigen

# MySQL bash command line

mysql -e "show databases;"              # Liste der Datenbanken, tabellenartig
mysql -e "show databases\G"             # Liste der Datenbanken, zeilenweise
mysql -e "connect nextcloud;show tables;"
mysql -e "show processlist;"
mysql -e "show processlist\G"

# MySQL aus SQL-Codedatei ausführen
echo "connect mysql; show tables;select Host,User,Password from user;" > mysql.sql
mysql < mysql.sql

# Anmelden ohne Kennwort (UNIX_SOCKET Authentication Plugin)

sudo su -                 # Wechseln zum root-User
mysql                     # kein User/Kennwort erforderlich
mysqlshow                 # Datenbanken anzeigen
mysqladmin                # MySQL Admin Console aufrufen

# MySQL User und Kennwörter

sudo mysql
mysql -u root -p 

> mysqladmin -u user -p password "NeuesPasswort" 

> create user 'www-data'@'localhost' identified by 'geheim';

> grant all privileges on datenbankname.* to 'user'@'localhost';
> grant all privileges on datenbankname.* to 'user'@'10.1.1.10';
> grant all privileges on datenbankname.* to 'user'@'%';
> flush privileges; 

> update mysql.user set Password=password('MyNewPass') where User='user';
> flush privileges;
> quit; 

# Notfalluser `rescue` anlegen (zweiter root-Account)

> create user 'rescue'@'localhost' identified by 'geheim';
> grant all on *.* to 'rescue@localhost' identified by 'geheim' with grant option;
> flush privileges;
> quit;

# Datenbank `RASPIBOX` erstellen

> create database if not exists RASPIBOX; 
> create user 'raspibox'@'localhost' identified by 'geheim';
> create user 'raspibox'@'10.1.1.10' identified by 'XOBCNYS4231';
> grant all privileges on RASPIBOX.* to 'raspibox'@'localhost';
