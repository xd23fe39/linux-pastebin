[IMG001]: res/md.png
[LNK001]: ../../README.md
[LNK002]: xd23fe39@yahoo.de

* * *

# Issue 17/002

Dieses Dokument ist Teil von [Technical Notes][LNK001] von [xd23fe39][LNK002].

## Titel

Bootvorgang optimieren und Bootmenü konfigurieren

## Beschreibung

Das GRUB-Bootmenü wird beim Rechner-Neustart zu lange angezeigt z.B. 10 Sekunden.

Es sind veraltete oder falsche Einträge im Bootmenü enthalten.

## Lösung

### Ubuntu: Terminal

1. Editieren der Standard-Einstellungen für `grub`

  ```
  sudo su -
  gedit /etc/default/grup
  ```

  ```
  # Start OS on Position 0 as default
  GRUB_DEFAULT=0

  # Default: GRUB_TIMEOUT=10
  GRUB_TIMEOUT=2
  ```

2. Ausführen von `sudo update-grub` schreibt die Änderungen in die Konfigurationsdatei
`grub.cfg`


### Links

- <https://wiki.ubuntuusers.de/GRUB/>
- <https://wiki.ubuntuusers.de/GRUB_2/Reparatur/>
