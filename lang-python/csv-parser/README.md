# CSV Parser

Einfaches Beispiel zum Laden und Verarbeiten von CSV-Daten mit Python.

## Umgang mit Datentabellen

Datensatz in der Datei:

```csv
"123457","frank","Frank Mustermann","id=6541643658910559107,ou=roles,ou=company,ou=de|id=6541643658910559104,ou=roles,ou=company,ou=de"
```

Datensatz in ein Array laden (hier: Variable `ret`):

    ret[row['uid']] = { 'UID' : row['uid'] , 'NAME' : row['cn'] , 'ROLES' : row['erroles'] } 
  
Im Speicher liegen die Datensätze dann in Form eines `Arrays von Typ Person-Dictionary` mit `uid` als Index. 

Der Zugriff auf eine Person mit der `uid` *frank*:

    person = person_dict['frank']
    print(person['NAME'])

Eine Iteration über ein solches Array vom Typ *Dictionary* sieht dann folgendermaßen aus:
  
```py
for key,person in personcache.items():
        print("Person:", person['NAME'], "|", person['UID'])
        print_role_membership(person, rolecache)
        print("---")
```

## Links

- <https://docs.python.org/3/library/csv.html>
- <https://docs.python.org/3/tutorial/datastructures.html>
