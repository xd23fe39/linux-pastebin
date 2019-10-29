# OpenSSL

Unvollständige Sammlung von Beispielen und Best Practices zu OpenSSL.

## Beispiele

### Versionsabfrage

    openssl version

### x509-Zertifikat anzeigen zur Kontrolle von Subject, Issuer, CertChain uvm.

    openssl s_client -connect $HOST:$PORT | openssl x509 -text -noout
## Links

- <https://linux.die.net/man/1/openssl>
- <https://linux.die.net/man/3/ssl>

## Stichworte

    openssl, x509, s_client, genrsa
