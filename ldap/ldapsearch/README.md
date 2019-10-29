# LDAPSEARCH

## Beispiel

```sh
$LDAPSEARCH -H "ldaps://ldap-host:636" -Z -b $BIND -w $PASS -D $USER "(objectclass=*)"
```

## Konfiguration

User-Kontext:

    ~/.ldaprc

## Links

- <https://linux.die.net/man/5/ldap.conf>

## Stichworte

    ldapsearch, .ldaprc, c_rehash
