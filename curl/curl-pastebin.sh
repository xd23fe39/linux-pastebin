
# CuRL und sFTP
curl -v --use-ascii --crlf -T /home/myuser/DATA/mydata.dat --ftp-ssl  -1 --cacert /var/certs/cacert.crt  "ftp://myftphost.com/file.dat"

# cURL und HTTPS
curl -v --cacert /var/certs/cacert.crt  "https://mysslhost.com"
 
