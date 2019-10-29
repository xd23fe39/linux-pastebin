# LDAPSEARCH

## Beispiel

```sh
$LDAPSEARCH -H "ldaps://ldap-host:636" -Z -b $BIND -w $PASS -D $USER "(objectclass=*)"
```

## Links

- <https://linux.die.net/man/5/ldap.conf>
