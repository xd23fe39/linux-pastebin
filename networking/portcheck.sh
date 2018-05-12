# Using openssl checking ports and SSL

# Check SSL 
openssl s_client -connect google.de:443

# Problem: openssl does not disconnect if successful => solution
echo Q | openssl s_client -connect google.de:443

# Using timeout 
timeout 2 openssl s_client -connect telekom.de:443

# Problem: how to disconnect using timeout
echo Q | timeout 2 openssl s_client -connect telekom.de:443

# Check Port and SSL samples
((echo Q | timeout 2 openssl s_client -connect google.de:443) > /dev/null 2>&1 && echo "$i: OK" || echo "$i: FAIL=$?" )

for i in 22 80 443; do
  ((echo Q | timeout 2 openssl s_client -connect telekom.de:$i) > /dev/null 2>&1 && echo "$i: OK" || echo "$i: FAIL ( Error: $?)" )
done
