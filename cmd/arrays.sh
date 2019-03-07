CNT=${#@}         # Anzahl Elemente der Liste
CLA=${@:1:3}      # Elemente 2 bis 3 in neue Liste schreiben
CLR=${@:2:3}      # Elemente 2 bis 3 in neue Liste schreiben
CLE=${@:2:$CNT}   # Elemente 2 bis Ende in neue Liste schreiben

echo
echo "ALL: $@"
echo "CLA: $CLA"
echo "CNT: $CNT"

echo
echo "  Usage: array.sh A B C D E F G"
echo
