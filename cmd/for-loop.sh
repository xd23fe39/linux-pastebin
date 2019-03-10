# Zählschleife
for i in {1..40}; do echo $i; done;

# Dateinamen-Schleife
for datei in *.txt
do
   echo $datei
done

# Zählschleife im C-Stil
for ((i=0; i < 10; i++)); do
  echo $i
done

# Loop über alle Elemente der Liste
for i in ${LISTE[*]}; do echo $i; done

# Quelle:
# http://www.tldp.org/LDP/abs/html/arrays.html
