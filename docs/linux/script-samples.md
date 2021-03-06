# Script Samples

## Ein einfaches 'Hallo'-Script

```
#!/usr/bin/env bash
# Script starts with the Shebang '#!' definition

echo "Hello script: $0"
```
## 

```
#!/usr/bin/bash
#
# Prüft alle 2 Sekunden die Verbindungen zu Host $1 mit Ausgabe auf stdout

# Funktion mit Parameter $1 (Hostname oder IP-Adresse)
function check_connection {
  echo -n "  * "
  echo -n "`netstat -na | grep ${1}`"
  echo " - ${1} "
}

# Schleife/Loop
while [ true ]
do
  check_connection ${1}
  sleep 2
done

# Exitcode ($?)
exit 0
```

## Beispiel

```
# SCRIPT_DIR setzen
SCRIPT_DIR="`dirname $0`"

# SCRIPT_DIR setzen
SCRIPT_NAME="`basename $0`"

# Textausgabe
printf "Hallo %s\n" "`printenv USER`"
```

Beispiele zu `awk`:

```
df | awk '{ POS += 1; printf(" %3d %10dK %5s %s \n", POS, $3, $5, $6); SUM = SUM + $3; } END { print "Summe (benutzt): " SUM/(1024*1024) " GB"; }'
```

```
ps -ef | awk '/apache/{ printf("%8s %6s \n",$2,$8);}'
```

``` 
history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
``` 

#### User-Liste anzeigen mit UID, Name

```
sudo cat /etc/passwd | awk -F ':' '{ printf("%5s %s\n",$3, $1); }' | sort -n
```
