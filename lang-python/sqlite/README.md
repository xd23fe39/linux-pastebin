# SQLite und Python

## Quellcode

```python
#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-

import sqlite3 as db

con = db.connect('example.db')
cur = con.cursor()    
cur.execute('SELECT SQLITE_VERSION()')
```

## Quellen

- Python, DB-API 2.0 interface for SQLite databases: https://docs.python.org/2/library/sqlite3.html
- SQLite, Core functions: https://sqlite.org/lang_corefunc.html
