[IMG001]: res/md.png
[LNK001]: ../../README.md
[LNK002]: xd23fe39@yahoo.de

* * *

# Issue 17/003

Dieses Dokument ist Teil der [Technical Notes][LNK001] von [xd23fe39][LNK002].

## Titel

Anlegen eines Benutzers unter Linux.

## Beschreibung

Der Benutzer `smith` soll angelegt werden. Für die Benutzeranlage wird der Benutzer `root` benötigt.

## Lösung

### Ubuntu: Terminal

1. Zuerst wird eine Gruppe angelegt (optional)

 ```
 sudo groupadd -g 5001 smith
 ```
  
2. Der Benutzer `smith` wird angelegt

 ```
 sudo useradd -c "Hauptbenutzer" -m -d "/home/smith" -u 5001 -g smith -s "/bin/bash" smith
 ```

3. Startkennwort für Benutzer `smith` setzen

 ```
 sudo passwd smith
 ```

4. SSH-Schlüssel für Remote-Anmeldung kopieren

 Der Benutzer `smith` wurde auf einem RaspberryPI angelegt. Eine Anmeldung soll zukünftig direkt auf dem entfernten
 RaspberryPI mit Benutzer `smith` möglich sein. Dazu muss zuerst der öffentliche Schlüssel kopiert werden:

 ```
 ssh-copy-id -i ~/.ssh/id_rsa.pub smith@raspberrypi
 ```

 Nun erfolgt die Anmeldung via `ssh`:

 ```
 ssh smith@rasperrypi
 ```
