# FritzBox Wireless LAN Konfiguration

## Zugriff auf die Fritzbox

Die folgende URL öffnet im Browser die Webkonsole der Fritzbox:

- https://fritz.box/

## Anmelden an der Webkonsole

Die Konfiguration des Zugriffsschutzes auf die Webkonole der Fritzbox findet man im `System`-Menü unter `Fritz!Box-Benutzer` auf der Karteikarte `Anmeldung im Heimnetz`:

Anmeldung im Heimnetz:
```
Anmeldung mit dem FRITZ!Box-Kennwort
```

Sollen mehrere Personen Zugriff auf die Konfiguration der Fritzbox erhalten, muss die Einstellung `Anmeldung mit FRITZ!Box-Benutzernamen und Kennwort` aktiviert werden.

## WLAN Einstellungen

#### Funknetz-Infoblatt drucken

Die Fritzbox stellt die Funktion `Infoblatt drucken` im Bereich **Funknetz** zur Verfügung. Nach jeder Änderung der Wireless LAN Konfiguration sollte das Dokument ausgedruckt und an einer zentralen Stelle im Haushalt hinterlegt werden, die nicht allen Besuchern zugänglich ist.

Es muss damit grechnet werden, dass manche Geräte ihre Verbindungsdaten *verlieren* bzw. durch Fehlverhalten von Benutzern die Verbindungsdaten verändert oder gelöscht werden.

#### Name des WLAN-Funknetzes (SSID)
```
WLAN175
```
Es sollten hier niemals der Modellname des Routers, der Familienname o.ä. Bezeichner
verwendet werden.

#### Name des WLAN-Funknetzes sichtbar
```
Aktivieren von Name des WLAN-Funknetzes sichtbar
```

Sicherer wäre hier das Deaktivieren der Einstellung - jedoch können sich einige
Geräte ggf. nicht mit einem unsichtbaren WLAN-Funknetz verbinden. Deshalb und
aus Gründen der Usability sollte die Einstellung aktiviert werden.


## WLAN-Sicherheit

#### WPA-Verschlüsselung

Wireless LAN (Funknetzwerk) verschlüsseln [[1][WEB001]]:
```
Aktivieren von WPA-Verschlüsselung (größte Sicherheit, siehe WPA2)
```

Hier unbedingt die größte Sicherheit aktivieren. Alle WLAN-fähigen Geräte
werden mit hoher Wahrscheinlichkeit WPA2 unterstützen. WPA gilt als unsicher,
WEP sollte nicht mehr verwendet werden.

#### WPA-Modus [[1][WEB001]]
```
WPA2 (CCMP)
```

#### WLAN-Netzwerkschlüssel
```
M5w6gjaPk9cV
```
Nur exemplarisch z.B. über [Passwort Generator][WEB002] erstellt!

Der WLAN-Netzwerkschlüssel muss auf allen Geräten, die sich mit
mit dem WLAN Verbinden wollen, eingegeben werden. Dies sollte
man bei der Vergabe des Netzwerkschlüssels immer berücksichtigen.

Eine Mindestlänge von 8 Zeichen wird empfohlen.

#### WLAN-Zugang auf die bekannten WLAN-Geräte beschränken
```
Aktivieren von WLAN-Zugang auf die bekannten WLAN-Geräte beschränken
```

Diese Einstellung wird empfohlen. Sollen neue Gräte dem Wireless LAN hinzugefügt
werden, kann diese Einstellung kurzfristig deaktiviert werden.


[WEB001]:https://de.wikipedia.org/wiki/WPA2
[WEB002]: http://www.onlinepasswortgenerator.de/
