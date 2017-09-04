# SSL

#### SSL

```
openssl | /etc/ssl/certs/ | /etc/ssl/private/ | /etc/ssl/openssl.cnf
```

Erstelle einen privaten Schlüssel:
```
sudo openssl genrsa -out /etc/ssl/private/server.key
```

Erstelle einen CSR (keine Passwortvergabe bei Serverzertifikaten):
```
sudo openssl req -new \
  -key /etc/ssl/private/server.key \
  -out /etc/ssl/private/server.csr
```

```
Country Name (2 letter code) [AU]:DE
State or Province Name (full name) [Some-State]:Rheinland-Pfalz
Locality Name (eg, city) []:Landau
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Privat
Organizational Unit Name (eg, section) []:Technik
Common Name (e.g. server FQDN or YOUR name) []:home-server.fritz.box
Email Address []:admin@home-server.fritz.box
```

Erstelle ein selbstsigniertes Zertifikat:
```
sudo openssl x509 -req -days 365 \
  -in /etc/ssl/private/server.csr \
  -signkey /etc/ssl/private/server.key \
  -out /etc/ssl/private/server.crt
```

#### Testen

Teste ein erstelltes Zertifikat:
```
sudo openssl verify /etc/ssl/private/server.crt
```

Teste SSL-Verbindung zu einem Server:
```
openssl s_client -connect google.com:443
```

#### Apache SSL Konfiguration

```
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
