## Replikationsfehler reparieren

Ein Replikationsfehler in der MySQL Datenbank löst eine Benachrichtigung aus.

- Benachrichtigung per E-Mail: `WARNING! MySQL Replication Check fails`

Die typische Fehlermeldung im Datenbank-Logfile lautet:

```
Error message: Error 'Duplicate entry ...
```

Eine typische Maßnahme bei dieser Art von Störung ist: Replikationsfehler überspringen.

- [Handbuch: mysql.com](https://dev.mysql.com/doc/refman/5.7/en/replication-problems.html)

1. Anmeldung mit `mysql`-Benutzer auf dem SLAVE-Node `ssh euaweb2`

   `sudo su - mysql`

1. Anmelden an MySQL

   `mysql -u root -p`

1. Replikationsfehler anlisten

   `mysql> SHOW SLAVE STATUS\G` oder als Tabelle: `SHOW SLAVE STATUS;`

1. Stoppen des Slave-Prozesses

   `mysql> STOP SLAVE;`

1. Replikationszähler manipulieren und überspringen von einem Replikationsschritt

   `mysql> SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1;`

   > Es können auch mehrere Replikationsschritte übersprungen werden.

1. Starten des Slave-Prozesses

   `mysql> START SLAVE;`

1. Status des MySQL Slaves prüfen

   `mysql> SHOW SLAVE STATUS\G`

## Konfiguration

### Master

```
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
symbolic-links=0

log-bin=/var/log/mysql/mysql-bin.log
server_id=10
sync_binlog=1

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
```

> *Hinweis:* # Disabling symbolic-links is recommended to prevent assorted security risks

### Slave

```
[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
symbolic-links=0

server_id = 2
relay_log = mysql-relay-bin
read_only = yes
master-host = 10.1.1.2
master-user = repl
master-password = iam
master-port = 3306
replicate-do-db = DBNAME_1
replicate-do-db = DBNAME_2
replicate-do-db = DBNAME_3
replicate-do-db = DBNAME_4
replicate-do-db = TestDB

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid
```

### MySQL Datenbanken anzeigen

```
# Konfiguration
MYSQL_USER=root
MYSQL_PASS=password
```

Bash Commands:

```
mysql --user=$MYSQL_USER --password=$MYSQL_PASS -e "SHOW DATABASES;"
```

```
mysql --user=$MYSQL_USER --password=$MYSQL_PASS -e "CONNECT iuam;SHOW TABLES;"
```
 

```
mysql --user=$MYSQL_USER --password=$MYSQL_PASS -e "show errors;"
```

### Aufruf des MySQL Clients 

```
mysql --user=$MYSQL_USER --password=$MYSQL_PASS
```

```
mysql --user=$MYSQL_USER --password=$MYSQL_PASS database-name
```

Weitere SQL Commands:

```
quit
```

```
connect my-db;
```

```
show errors;
```

```
show slave status;
```

```
show master status;
```

### MySQL Dump erstellen

```
mysqldump --user=$MYSQL_USER --password=$MYSQL_PASS test
```
