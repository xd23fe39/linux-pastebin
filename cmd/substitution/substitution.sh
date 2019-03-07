
echo $(($(grep dn=  trace01.log | wc -l)+$(grep dn= trace01.log | wc -l)))  # Addiere Line counter
grep dn=\"uid=  trace.log | cut -f 2 -d '"' | cut -f 2 -d '='               # extrahiere Wert
