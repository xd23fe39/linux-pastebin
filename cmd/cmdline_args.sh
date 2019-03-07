#!/bin/bash
#
# Beispiel Usage:
#
#  ./sample.sh a b -c=22 -x=12 d e
#
# array=("${(@)array:#<element to remove>}")

CNT=${#@}         # Anzahl Elemente der Liste
CLA=${@:1:3}      # Elemente 2 bis 3 in neue Liste schreiben
CLR=${@:2:3}      # Elemente 2 bis 3 in neue Liste schreiben
CLE=${@:2:$CNT}   # Elemente 2 bis Ende in neue Liste schreiben

echo "Command Line Options and Parameter"
echo

echo
echo "Kommandozeilenparameter:"
echo "---"
echo $@
echo "---"
echo

echo "Main-Loop:"
echo "---"
#################################################################
## COMMAND LINE ARGS PARSER
##
ARGS=()
ARGV=()
let ARGN=0
for ITEM in $@; do
    echo -n "$ITEM "
    if [[ "$ITEM" == -* ]]; then
        NAM=$(echo $ITEM | cut -d '=' -f 1)
        VAL=$(echo $ITEM | cut -d '=' -f 2)
        ARGS+="$NAM "
        ARGV+="$VAL "
        continue
    fi
    PARM+="$ITEM "
    ARGN=$(( ARGN + 1 ))
done
#################################################################
echo

echo
echo "ARGS-Loop:"
for ITEM in "$ARGS"; do
    echo -n "$ITEM "
done
echo 

echo
echo "PARM-Loop:"
for ITEM in "$PARM"; do
    echo -n "$ITEM "
done
echo 

echo "---"
echo OCNT=$OCNT
echo PCNT=$PCNT
echo "---"

echo
echo "Completed!"
echo "---"
echo
