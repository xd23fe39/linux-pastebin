[IMG001]: res/md.png
[LNK001]: ../../README.md
[LNK002]: xd23fe39@yahoo.de

* * *

# Issue 17/001

Dieses Dokument ist Teil der [Technical Notes][LNK001] von [xd23fe39][LNK002].

Issue             |Beschreibung
------------------|------------------------
Betriebsystem     |Linux/Ubuntu


## Titel

Der Prozess **mediascanner-service-2.0** blockiert das System.

## Beschreibung

Der Mediascanner löst im Systemlog `dmesg -w` permanente Fehlereinträge aus:

`[ 2554.124515] audit: type=1400 audit(1483734126.695:59256): apparmor="DENIED" operation="open" profile="/usr/lib/*/mediascanner-2.0/mediascanner-extractor..."`

Nach dem Einhängen eines Wechseldatenträgers startet ein Prozess mit dem Namen
**mediascanner-service-2.0**.

Der Prozess **mediascanner-service-2.0** belegt nahezu die gesamte CPU.

Das System scheint "blockiert" bzw. stark "beschäftigt" zu sein.

## Lösung

### Deaktivieren von `mediascanner-service`

Systemweit:

```
sudo sh -c "echo manual >> /usr/share/upstart/sessions/mediascanner-2.0.conf"
```

Oder nur für den aktuellen Benutzer:

```
echo manual >> ~/.config/upstart/mediascanner-2.0.override
```


### Anlegen der `.nomedia`-Datei

Der `mediascanner` ignoriert Verzeichnisse mit `.nomedia`-Datei.

```
cd /path-to-large-filesystem
echo "mediascanner: Ignore this Filesystem" >./.nomedia
```

### Deinstallieren von `mediascanner-service`

Oder gleich das gesamte Funktionspaket deinstallieren:

```
sudo apt-get purge mediascanner2.0 libmediascanner-2.0-0
```

Prozess anzeigen mit `top` oder `ps -ef | grep mediascanner`.


### Wechselmedien-Einstellungen ändern

1. Starten von `Systemeinstellungen` | `Informationen` | `Wechselmedien`

2. Aktivieren Sie die Einstellung `Beim Einlegen von Datenträgern nie Nachfragen oder Programme starten`



## Links

- <https://bugs.launchpad.net/ubuntu/+source/mediascanner2/+bug/1398614>
- <http://askubuntu.com/questions/541928/how-to-disable-mediascanner-service#542582>
- <http://askubuntu.com/questions/587489/what-is-the-mediascanner-service-and-how-to-avoid-getting-it-installed#628272>
