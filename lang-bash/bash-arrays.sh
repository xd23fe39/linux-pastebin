#!/bin/bash
#
# cmd a b c d e f g --p1 --p2

# array=("${(@)array:#<element to remove>}")

CLP=($@)               # Verwandle in Array
CNT=${#CLP[@]}         # Anzahl Elemente von Array merken
CLA=${CLP[@]:1:3}      # Elemente 2 bis 3 in neues Array schreiben
CLR=${CLP[@]:2:3}      # Elemente 2 bis 3 in neues Array schreiben
CLE=${CLP[@]:2:$CNT}   # Elemente 2 bis Ende i neues Array schreiben

echo "Counter: $CNT"
echo

echo
echo "Kommandozeilenparameter:"
echo "---"
echo $@
echo "---"

echo
echo "Ergebnisausgabe"
echo "---"
echo $CLA
echo $CLR
echo $CLE
echo "---"
echo 

echo "Foar-Each-Loop:"
echo "---"
for ITEM in $@; do
    if [[ "$ITEM" == *--* ]]; then
        continue
    fi
    echo -n "$ITEM "
done
echo
echo "---"
echo
