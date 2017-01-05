[IMG001]: res/md.png
[LNK001]: ../../README.md
[LNK002]: xd23fe39@yahoo.de

* * *

# Issue 17/001

Dieses Dokument ist Teil der [Technical Notes][LNK001] von [xd23fe39][LNK002].

## Titel

Der Prozess **mediascanner-service-2.0** blockiert das System.

## Beschreibung

Nach dem Einhängen eines Wechseldatenträgers startet ein Prozess mit dem Namen
**mediascanner-service-2.0**.

Der Prozess **mediascanner-service-2.0** belegt nahezu die gesamte CPU.

Das System scheint "blockiert" bzw. stark "beschäftigt" zu sein.

## Lösung

### Ubuntu: *Systemeinstellungen*

1. Starten von `Systemeinstellungen` | `Informationen` | `Wechselmedien`

2. Aktivieren Sie die Einstellung `Beim Einlegen von Datenträgern nie Nachfragen oder Programme starten`

### Ubuntu: Terminal

Oder gleich das gesamte Funktionspaket deinstallieren:

```
sudo apt-get purge mediascanner2.0 libmediascanner-2.0-0
```

Prozess anzeigen mit `top` oder `ps -ef | grep mediascanner`.


### Links

- <https://bugs.launchpad.net/ubuntu/+source/mediascanner2/+bug/1398614>
