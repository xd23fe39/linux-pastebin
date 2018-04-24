# SSL

#### SSL

```
openssl | /etc/ssl/certs/ | /etc/ssl/private/ | /etc/ssl/openssl.cnf
```

Erstelle einen privaten Serverschlüssel:

```sh
sudo openssl genrsa -out /etc/ssl/private/server.key
```

Erstelle einen CSR (keine Passwortvergabe bei Serverzertifikaten):

```sh
sudo openssl req -new \
  -key /etc/ssl/private/server.key \
  -out /etc/ssl/private/myserver.fritz.box.csr
```

```sh
Country Name (2 letter code) [AU]:DE
State or Province Name (full name) [Some-State]:Hessen
Locality Name (eg, city) []:Frankfurt am Main
Organization Name (eg, company) [Internet Widgits Pty Ltd]:X-Company
Organizational Unit Name (eg, section) []:Technik
Common Name (e.g. server FQDN or YOUR name) []:myserver.fritz.box
Email Address []:admin@myserver.fritz.box
```

Erstelle ein selbstsigniertes Zertifikat:

```sh
sudo openssl x509 -req -days 365 \
  -in ./testserver.fritz.box.csr \
  -signkey ./server.key \
  -out ./testserver.fritz.box.crt
```

#### Testen

Teste ein erstelltes Zertifikat:

```sh
sudo openssl verify /etc/ssl/private/server.crt
```

Teste SSL-Verbindung zu einem Server:

```sh
openssl s_client -connect google.com:443
```

#### Apache SSL Konfiguration

```sh
<IfModule mod_ssl.c>
	<VirtualHost *:4443>
		DocumentRoot /var/www/html

    # Enable/Disable SSL for virtual host
    SSLEngine on

    # SSL Certificate file and private key
    SSLCertificateFile	/etc/ssl/private/server.crt
    SSLCertificateKeyFile /etc/ssl/private/server.key
  </VirtualHost>
</IfModule>
```
