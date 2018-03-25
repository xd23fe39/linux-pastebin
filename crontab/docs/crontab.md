# Crontab Technote (Linux)

## Beschreibung

Anlisten oder editieren der `crontab` des aktuellen Users:

```sh
crontab -l          # List crontab of current user
crontab -e          # Edit crontab of current user
```

Nutze `man crontab` für weitere Informationen.

## Beispiel für einen `crontab`-Eintrag

Skript wird ausgeführt Mo-Fr, 02:35 Uhr:

```sh
35   2   * * 1-5    /home/user/bin/job.sh >> /dev/null 2>&1
```

## Starte Script bei jedem Reboot

```sh
@reboot     /home/me/myscript.sh
```

## Umgebungsvariablen für `crontab`

Kommt es bei der Ausführung von Skripten via `crontab` zu Problemen, sind häufig fehlerhafte oder nicht gesetzte Umgebungsvariablen die Ursache.

Die aktuellen Umgebungsvariablen kann man sich mit `env` oder `set` anzeigen lassen und in die crontab übernehmen. Ein kleines Skript dazu könnte folgendermaßen aussehen:

```
echo "# CRONTAB: $USER@$HOSTNAME"
echo "PATH=$PATH"
echo "LANG=$LANG"
echo "HOSTNAME=$HOSTNAME"
echo "HOME=$HOME"
```

Beispiel einer `crontab`-Definition mit vordefinierten Umgebungsvariablen:

```
# crontab user@node
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:
LANG=de_DE.utf8
HOSTNAME="myhost"
```


## Debug crontab Output

```
* * * * * env > /tmp/crontab.env
```

## Links

- <https://wiki.ubuntuusers.de/Cron/>

