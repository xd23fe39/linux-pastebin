# A simple Password Generator (pwgen)

## Aufruf

Der Programmaufruf erfordert keine Übergabeparameter.

```bash
$> pwdgen 
```

* * * 

## Code-Schnipsel

### `Shebang` und Encoding-Type für das Python Skript

```python
#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-
```

### Die Funktion `count_char` 

Gibt die Anzahl gefundener Zeichen `search` in der Zeichenkette `text` zurück. Wird verwendet, wenn nur eine bestimmter Anzahl von gleichen Zeichen in einer Passphrase erhalten sein sollen.

```python
def count_char(text, search):
```



