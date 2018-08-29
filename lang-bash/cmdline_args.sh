#!/bin/bash

echo
echo "Command Line Args parsen"
echo

echo
echo "Kommandozeilenparameter:"
echo "---"
echo $@
echo "Counter: $(#@)"
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
    ARGN=$(( PCNT + 1 ))
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
echo "ARGV-Loop:"
for ITEM in "$ARGV"; do
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
