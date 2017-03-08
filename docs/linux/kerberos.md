# Kerberos

#### Zusammenfassung

- ein verteilter **Authentifizierungsdienst**
- verwendet **Tickets** anstelle von Kennwörtern
- ein *Client* muss sich zuerst beim **Kerberos-Server** anmelden
- weitere Anmeldungen können entfallen, wenn *Dienste* auf Servern Kerberos unterstützen
- Dienste können sein `ssh` oder `apache2`

#### Interessante Links und Quellen

- https://de.wikipedia.org/wiki/Kerberos_%28Informatik%29
- https://help.ubuntu.com/community/Kerberos
- http://www.microhowto.info/howto/configure_apache_to_use_kerberos_authentication.html
- https://gist.github.com/aaugustin/10715655

#### Wichtige Voraussetzungen

- die Zeiteinstellungen zw. den beteiligten Systemen sollte synchronisiert sein ([NTP][RES002], Abweichungen < 300s)
- Auflösung der vollständigen Domainnamen (FQDN) muss *forward-and-reverse-resolveable* sein
- Firewall Konfiguration für Kerberos-Server

#### Firewall-Konfiguration

Bei Kerberos-Serverkonfiguration; siehe dazu auch die Einstellung von `kdc_ports` in der Datei `/etc/krb5kdc/kdc.conf`:

     kerberos      88/udp    kdc    # *Kerberos V5 KDC
     kerberos      88/tcp    kdc    # *Kerberos V5 KDC
     klogin        543/tcp          # Kerberos authenticated rlogin
     kshell        544/tcp   cmd    # and remote shell
     kerberos-adm  749/tcp          # Kerberos 5 admin/changepw
     kerberos-adm  749/udp          # Kerberos 5 admin/changepw
     krb5_prop     754/tcp          # Kerberos slave propagation
     eklogin       2105/tcp         # Kerberos auth. & encrypted rlogin
     krb524        4444/tcp         # Kerberos 5 to 4 ticket translator


[RES001]: https://de.wikipedia.org/wiki/Kerberos_%28Informatik%29
[RES002]: https://de.wikipedia.org/wiki/Network_Time_Protocol
