# LDAPSEARCH

## Beispiel

```sh
$LDAPSEARCH -H "ldap://ldap-host:389" -b $BASE -w $PASS -D $USER "(objectclass=*)"
$LDAPSEARCH -H "ldaps://ldap-host:636" -Z -b $BASE -w $PASS -D $USER "(objectclass=*)"
```

## Konfiguration

User-Kontext:

    ~/.ldaprc

## Links

- <https://linux.die.net/man/5/ldap.conf>
- <https://linux.die.net/man/1/ldapsearch>

## Stichworte

    ldap, openldap, ldapsearch, ldap.conf, .ldaprc, c_rehash
