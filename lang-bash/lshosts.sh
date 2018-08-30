#!/bin/bash
#
# lshosts.sh

DEBUG=""
SCRIPT_DIR=$(dirname $0)       # Script-Verzeichnis
SCRIPT_NAME=$(basename $0)     # Script-Name
PWD=$(pwd)                     # Aktuelles Verzeichnis

OCNT=${#@}   # Anzahl Argumente beim Aufruf merken

# Input file $HOME/conf/servers.conf
INPUT_FILE="$HOME/conf/servers.conf"

# Keine Newline pro Item ausgeben
SHORT=

# Suchkriterium verbessern (Suche: FILTER und ITEM)
FILTER=

function _usage() {
  echo
  echo "$SCRIPT_NAME - List managed hosts on $(hostname -s)"
  echo
  echo "  Server configuration:"
  echo "    $INPUT_FILE"
  echo 
  echo "  Options: --filter --ip[--short --cols] --help" 
  echo  
  if [ "$1" == "exit" ]; then
    exit 2
  fi
}

function getops() {
  case $1 in
    --help|-h)
      _usage "exit"
      ;;
    --debug|-d) 
      DEBUG="DEBUG"
      ;;
    --ip|-s) 
      FILTER="IP"
      ;;
    --filter|-f|--search|--s) 
      FILTER="FILTER"
      ;;
    --short|--cols|-c) 
      SHORT="SHORT"
      ;;
    --rows|--r) 
      SHORT=
      ;;
    *)
      _usage "exit"
      ;;
  esac    
}

#################################################################
## COMMAND LINE ARGS PARSER
##
ARGS=()
ARGV=()
for ITEM in $@; do
  # echo -n "$ITEM "
  if [[ "$ITEM" == -* ]]; then
      NAM=$(echo $ITEM | cut -d '=' -f 1)
      VAL=$(echo $ITEM | cut -d '=' -f 2)
      ARGS+="$NAM "
      ARGV+="$VAL "
      ARGN=$(( $ARGN + 1 ))
      continue
  fi
  PARM+="$ITEM "
done
#################################################################

if [ $ARGN == 0 ]; then
  _usage "exit"
fi

let PCNT=0
for ARG in $ARGS; do
  getops $ARG
done

# Debug options and parameters
if [ "$DEBUG" == "DEBUG" ]; then
  echo 
  echo FILTER=$FILTER
  echo ARGS=$ARGS
  echo ARGN=$ARGN
  echo OCNT=$OCNT
  echo PARM=$PARM
  echo
fi

# Loop parms
for ITEM in $PARM; do
    if [ "$DEBUG" == "DEBUG" ]; then
      echo "--- ITEM:"
      grep -i $ITEM $INPUT_FILE
      echo "--- CONTENT:"
    fi
    if [ "$OCNT" == "0" ]; then 
      grep -i $ITEM $INPUT_FILE
    fi
    if [ "$FILTER" == "FILTER" ]; then
      # grep -i $ITEM $INPUT_FILE
      grep -i $ITEM $INPUT_FILE | awk  -F';' '{ printf("%-14s %-16s %-28s %-14s %s \n", $1, $4, $2, $3, $5) ; }'
    fi
    if [ "$FILTER" == "IP" ] && [ "$SHORT" == "SHORT" ]; then
      echo -n $(grep -i $ITEM $INPUT_FILE | cut -d ";" -f 4) 
      continue
    fi
    if [ "$FILTER" == "IP" ]; then
      grep -i $ITEM $INPUT_FILE | cut -d ";" -f 4
    fi
done
echo

exit 0

