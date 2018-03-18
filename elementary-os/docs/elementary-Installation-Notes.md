Elementary OS (Loki) Installation Guide
=======================================

[0]: https://elementary.io/de/
[1]: https://atom.io/
[2]: https://github.com/
[3]: https://daringfireball.net/projects/markdown/
[4]: http://elementaryos.stackexchange.com/questions/7507/how-can-i-add-a-ppa-in-loki
[5]: https://elementary.io/de/docs/installation

Das auf Debian Linux und Ubuntu basierende [elementaryOS][0] ist ein schnelles, einfaches, leistungsstarkes und schönes Betriebssystem für Notebooks. Eine Anleitung zur Installation findet man [hier][5].

Dieses Dokument wurde als [Markdown][3]-Dokument verfasst und kann mit allen Texteditoren bearbeitet oder angezeigt werden. Mit der `MarkdownViewer`-Erweiterung für Firefox oder der Preview im Texteditor `atom` kann man sich .md-Dateien formatiert anzeigen lassen.

Neue Paketquellen hinzufügen
----------------------------

Fehlt das Kommandozeilentool `add-apt-repository`, dann sollte es direkt nachinstalliert werden, um spter zusätzliche Paketquellen (PPA-Repositories) z.B. für die Installation des Editors `atom` hinzufügen zu können.

Prüfen, ob installiert:

```shell
sudo apt search software-properties-common
```

Installieren:

```shell
sudo apt install software-properties-common
sudo apt-get update
```

Installation von `atom`
-----------------------

Die Installation des leistungsfähigen Texteditors `atom` ist optional. Wer Anwendungen entwickeln möchte, findet in `atom` ein sehr effektives und erweiterbares Werkzeug zum Schreiben von Programmen und Skripten.  

> Das Erweiterungspaket `software-properties-common` ist zwingend erforderlich und muss zuerst [installiert][4] werden. Anschließend kann eine neue Paketquelle via  `add-apt-repository` hinzugefügt werden.

```shell
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
```

Die Installation von `atom` wird anschließend durchgeführt:

```shell
sudo apt-get install atom
```

Bei der Installation von [`atom`][1] werden weitere Pakete, wie z.B. das Versionsverwaltungs-Werkzeug [`git`][2] gleich mit installiert.

```shell
git --version
```

Installation essentieller Anwendungen
-------------------------------------

```shell
sudo apt install xkeepass
sudo apt install firefox
sudo apt install libreoffice
sudo apt install vlc
```

Zum "Aufwecken" meines FreeNAS Servers aus dem Standby:

```shell
sudo apt install wakeonlan
```

Installation weiterer Anwendungen
---------------------------------

Anwendungen basierend auf dem `electronjs`-Framework:

- <https://electronjs.org/>

Startmedium-Ersteller (essentiell):

- <https://etcher.io/>

- Etcher kann auch über den Paketmanager `apt` installiert werden:

```sh
sudo apt install etcher-electron
```

Stacer System Monitor und Optimierer:

- Installation von `stacer` über PPA-Repository (Ubuntu):

```sh
sudo add-apt-repository ppa:oguzhaninan/stacer
sudo apt-get update
sudo apt-get install stacer
```

Nextcloud Desktop-Client für die Private-Cloud:

- Homepage: <https://nextcloud.com/install/>
- Installation über PPA-Repository:

```sh
sudo add-apt-repository ppa:nextcloud-devs/client
sudo apt-get update
sudo apt-get nextcloud-client
```
