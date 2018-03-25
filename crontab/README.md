# CRONTAB Technote und Helper-Scripte

- [Technote](./docs/crontab.md)

## Erzeugen eines neuen Skriptes

Neues Script namens `demo.sh` erstellen

```sh
cd crontab/bin
./build-script all > demo.sh
chmod u+x demo.sh
```

## Skript via crontab aufrufen

> **Hinweis:** Die `crontab` ist abhängig vom Benutzer. Deshalb zuerst zum korrekten Benutzerkonto wechseln. Die `crontab` des `root`-Benutzers nur dann verwenden, wenn unbedingt erforderlich (z.B. zum Sichern von `/etc`).

1. Anlegen oder ändern der crontab

   `chrontab -e`

2. Skript in der crontab eintragen

```sh
# demo.sh
35  2  *  *  1-5    /home/user/bin/demo.sh >> /dev/null 2>&1
@reboot             /home/user/bin/demo.sh >> /dev/null 2>&1
```

3. Änderungen speichern und `crontab` neu laden (via vi als Standardeditor)

   `ESC` + `:` + `x`
