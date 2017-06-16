# Linux Monitoring

## Begriff

Der Begriff **Monitoring** ist ein Überbegriff für die systematische Beobachtung, Messung, Protokollierung
und Präsentation relevanter Größen eines zu überwachenden Systems. 

## Praxisbeispiele

### Überwachung der Auslastung von Filesystem `/home`

#### Beschreibung des Ecosystems

Die Auslastung oder Belegung eines Filesystems kann mittels Kommandozeile und dem Befehl `df` 
auf den meisten Unix-Systemen angezeigt werden.
```
df -h
```

Da uns für unser einfaches Beispiel ausschließlich das `/home`-Verzeichnis interessiert,
lässt sich die Anzeige entsprechend auf die Zeile `/home` reduzieren:
```
df -h /home | tail -1 
```
Mit beiden Ergebnissen kann bereits eine Beobachtung der Auslastung von Filesystem `/home`
durch einen Administrator realisiert werden. Weniger geeignet ist das Ergebnis für eine
systematische Protokollierung und Überwachung. Eine Erweiterung der Parameterabfrage
unter Berücksichtigung der folgenden Anforderungen ist erforderlich:

- Einfache Datenstruktur (eindeutiger Messpunkt, leicht zu verarbeiten, platzsparend)
- Zeitpunkt der Beobachtung/Messung
- Eindeutige ID der Messgröße
- Wert

Die Ausgabe der folgenden Kommandozeile erfüllt die o.a. Anforderungen:
```
 df -h /home | tail -1 | awk -F" " '{printf("ID: FSH17001, TIME: %s, Wert: %d, (%s), DF:%s\n", strftime("%y-%m-%d %H:%M:%S"), $5, $5, $6);}'
```
