 
# Ausgabe der IP-Adressen 
ifconfig -a | grep 'inet addr' | cut -d: -f 2 | awk '{print $1}'

# Ausgabe der IPv4-Adressen
ip a | grep 'inet ' | awk '{print $2}'

# Ausgabe der IPv4 und IPv6-Adressen
ip a | grep 'inet' | awk '{print $2}'

# IP-Adresse von eth0 nach $ETH0
ETH0=$(ifconfig eth0 | grep 'inet addr' | cut -d: -f 2 | awk '{print $1}')

# IP4 Adressen anlisten
ip a | grep 'inet '

# IP6 Adressen anlisten
ip a | grep 'inet6'

# Offene Ports (TCP)
netstat -tlna
