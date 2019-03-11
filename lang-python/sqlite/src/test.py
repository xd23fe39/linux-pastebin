#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
# test.py
# https://docs.python.org/2/library/sqlite3.html
# https://sqlite.org/lang_corefunc.html

import sqlite3 as sqlite
import sys as sys
import os as os

# Database Connection
# https://www.connectionstrings.com/
db_connect_str = ':memory:'

con = None

try:
    # Verbindung aufbauen (Dummy)
    con = sqlite.connect(db_connect_str)
    
    # Cursor holen für anschließendes execute()
    # https://sqlite.org/lang_corefunc.html
    cur = con.cursor()    
    cur.execute('SELECT SQLITE_VERSION()')
    
    # Datensatz lesen
    # Fetches the next row of a query result set
    data = cur.fetchone()
    
    # Ausgabe
    print "SQLite version: %s" % data    
    print "Platform: %s" % sys.platform

except sqlite.Error, e:
    
    print "Error %s:" % e.args[0]
    sys.exit(1)
    
finally:
    
    if con:
        con.close()
