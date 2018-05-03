 
# Ausgabe der IP-Adressen 
ifconfig -a | grep 'inet addr' | cut -d: -f 2 | awk '{print $1}'

# IP-Adresse von eth0 nach $ETH0
ETH0=$(ifconfig eth0 | grep 'inet addr' | cut -d: -f 2 | awk '{print $1}')
