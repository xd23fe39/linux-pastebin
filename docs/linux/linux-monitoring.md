# Linux Monitoring

## Begriff

Der Begriff **Monitoring** ist ein Überbegriff für die systematische Beobachtung, Messung, Protokollierung
und Präsentation relevanter Größen eines zu überwachenden Systems oder Ökosystems. 

### Definitionen

[WEB002]: https://www.klipfolio.com/resources/kpi-examples#types-of-kpis
[WEB003]: https://de.wikipedia.org/wiki/Topologie_(Rechnernetz)
[WEB004]: http://www.elektronik-kompendium.de/sites/net/0503281.htm

- Key Performance Indicators (KPIs) [[1][WEB002]]
- Service Level Agreements (SLAs)
- Configuration Items (CIs)

CIs können sein Business Services, Workstations, Servers, Network Components oder Documents. Zur Strukturierung der CIs muss eine geeignete Topologie [[3][WEB003]] [[4][WEB004]] gewählt werden, wie z.B. Lokalisation, Standort, Organisation, Bereich, Interne Services, SLAs etc. In der Regel werden CIs in baum- und listenartigen Strukturen organisiert.

## Praxisbeispiele

### Überwachung der Auslastung von Filesystem `/home`

#### Beschreibung des Ecosystems

Im vorliegenden Fall wird davon ausgegangen, dass auf einem System das Betriebssystem 
Linux installiert ist und die Benutzerverzeichnisse im Filesystem unter `/home` 
abgelegt sind. Ein Administrator will sicherstellen, dass die Benutzer des Systems
immer genügend Speicherplatz unter `/home` vorfinden.

Die Auslastung oder Belegung eines Filesystems kann mittels Kommandozeile und dem Befehl `df` 
auf den meisten Unix-Systemen angezeigt werden.
```
df -h
```

Da uns in diesem vereinfachten Beispiel ausschließlich das `/home`-Verzeichnis interessiert,
lässt sich die Anzeige entsprechend auf die Zeile `/home` reduzieren:
```
df -h /home
```
Mit dieser einfachen Befehlszeile kann bereits eine Beobachtung der Auslastung von Filesystem `/home`
durch einen Administrator realisiert werden. 

#### Systematisches Beobachten

[WEB001]: http://www.theunixschool.com/2013/01/gawk-date-and-time-calculation-functions.html

Weniger geeignet ist das Ergebnis für eine
systematische Protokollierung und Überwachung. Eine Erweiterung der o.a. Befehlszeile
unter Berücksichtigung der folgenden Anforderungen ist erforderlich:

- Einfache Datenstruktur (eindeutiger Datensatz, strukturierte Daten)
- Zeitpunkt der Beobachtung/Messung
- Eindeutige ID der Messgröße
- Wert

Die folgenden Kommandozeile ([awk][WEB001]) berücksichtigt die o.a. Anforderungen:
```
 df -h /home | tail -1 | awk -F" " '{printf("ID: FSH17001, TIME: %s, Wert: %d, (%s), DF:%s\n", strftime("%y-%m-%d %H:%M:%S"), $5, $5, $6);}'
```

Die Ausgabe der Kommandozeile sieht dann ungefähr so aus:
```
ID: FSH17001, TIME: 17-06-16 19:46:28, Wert: 45, (45%), DF:/home
```

Durch eine regelmäßige Ausführung der oben entwickelten Kommandozeile und Umleitung der 
Ausgabe in eine Protokolldatei können Daten zur Systemüberwachung gewonnen werden.

