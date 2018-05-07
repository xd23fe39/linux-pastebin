# Dateien verschlüsseln

*Released 2017 by xd23fe39*

- openssl
- gpg

*Dieses Dokument wurde vom Autor primär zur Eigennutzung erstellt. Der Autor übernimmt keinerlei Gewähr auf Aktualität, Richtigkeit und Vollständigkeit der bereitgestellten Informationen.*

## Quellen

- https://www.openssl.org/
- https://stackoverflow.com/
- https://gnupg.org/

## Umgang mit Kennwörtern beim Skripten

Achtung: Konfigurationsdateien oder Kennwortdateien dürfen niemals in Versionskontrolle eingebunden werden!
```bash
# .gitignore
*.secret
.secret
*.conf
.conf
```

Kennwortdatei anlegen und ausschließlich für einen Benutzer lesbar anlegen:
```bash
echo "password" >.secret
chmod 600 .secret
```

Oder:

```sh
UUID=$(uuidgen)
echo "KEY:$UUID" > ./.key
sha256sum .key > .secret
chmod 400 .key .secret
# Check
sha256sum --check .secret
```

## Dateien verschlüsseln mit `openssl enc -e -aes256`

```bash
# encrypt
openssl enc -e -aes256 -in data/geheim.txt -out geheim.txt.enc
# decrypt
openssl enc -d -aes256 -in geheim.txt.enc
```

Verwendung des Passwortes aus der Passwortdatei `.secret`:
```bash
pass=$(cat .secret | awk '{print $1}')
openssl enc -e -aes256 -in data/geheim.txt -out geheim.txt.enc -pass pass:"${pass}"
```

## Dateien entschlüsseln mit `openssl enc -d -aes256`
```bash
pass="`cat .secret`"
openssl enc -d -aes256 -in geheim.txt.enc -pass pass:"${pass}"
```

## Verschlüsseltes bash-Script laden und ausführen

Ausführen eines verschlüsselten Bash-Skriptes `geheim.sh.enc`:
```bash
pass="`cat .secret`"
eval "`openssl enc -d -aes256 -in data/geheim.sh.enc -pass pass:${pass}`"
echo $secret_text
```

Das geheime Script sieht wie folgt aus:
```bash
# geheim.sh
# openssl enc -e -aes256 -in geheim.sh -out geheim.sh.enc

# Setze eine globale variable
secret_text="This is a secret passphrase!"

# Aufruf von echo
echo "Running a secret script!"
```

## Alternativ mit gpg

```bash
gpg -d geheim.txt
```
