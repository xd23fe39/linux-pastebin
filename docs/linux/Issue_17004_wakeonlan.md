[IMG001]: res/md.png
[IMG002]: res/Bildschirmfoto-WakeOnLan-2017.png
[LNK001]: ../../README.md
[LNK002]: xd23fe39@yahoo.de

* * *

# Issue 17/004

Dieses Dokument ist Teil der [Technical Notes][LNK001] von [xd23fe39][LNK002].

## Titel

Aufwecken eines Gerätes durch Drücken von `Strg` + `Alt` + `F`.

## Beschreibung

Ein WOL-fähiges Gerät soll über das Drücken einer bestimmten (frei wählbaren)
Tastenkombination aufgeweckt (wake-on-LAN) werden.

## Lösung

Lösung für Ubuntu 16.04 und ähnliche Betriebssysteme.

#### Installieren des Kommandozeilen-Tools `wakeonlan`

Prüfen, ob bereits installiert:

```
sudo apt list wakeonlan
```

Installieren:

```
sudo apt install wakeonlan
```

#### Konfiguration des Tastenkürzels unter Ubuntu

Funktion: `Systemeinstellungen | Tastatur | Tastenkürzel`

![Bildschirmfoto-wakeonlan][IMG002]

Als Befehl wird `wakeonlan <mac-address>` eingegeben, wobei `mac-address` die
MAC-Adresse des aufzuweckenden Gerätes ist.

Die MAC-Adresse kann ermittelt werden über:

```
ifconfig -a
arp
```
