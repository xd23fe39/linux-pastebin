
INIT Scripte für Linux/Solaris
==============================

## INIT Block

Dieser Block wird in das Skript eingefügt und von `chkconfig` gelesen:

```shell
### BEGIN INIT INFO
# Provides: YOUR-SCRIPT
# Required-Start: $local_fs $remote_fs $network
# Required-Stop:  $local_fs $remote_fs $network
# Should-Start: cron sendmail postfix
# Default-Start:  3 5
# Default-Stop:   0 1 2 6
# Description:    Your short description
### END INIT INFO  
```

## INIT-Script installieren

Installation und Konfiguration des Scriptes:

```shell
# INIT Script hinzufügen/aktivieren
#
cp YOUR-SCRIPT /etc/init.d
chkconfig --add YOUR-SCRIPT
chkconfig YOUR-SCRIPT on
```

## Administration

### Script aufrufen

```shell
service YOUR-SCRIPT <option> [<parameter>]
```

Oder auch direkt (nicht empfohlen):

```shell
/etc/init.d/YOUR-SCRIPT <option> [<parameter>]
```
