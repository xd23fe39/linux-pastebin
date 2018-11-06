#!/bin/bash

STARTDIR=$(pwd)                            # Aktuelles Verzeichnis beim Scriptstart
BASEDIR=$(cd `dirname $0`; cd ..; pwd)     # Setze aktuelles Verzeichnis 

SHELL=$(which bash)
RELEASE=$(awk -F " " '{print $1 " " $2 " " $3 " " $4}' /etc/issue)
UNAME=$(uname -n -s -r -i)
UUID=$(uuidgen)
SERVERTYPE=$(hostname -s | cut -c1-5)
PROGNAME=${0:=Unknown} 

function _print_dir() {
  echo
  echo "  Platform: $UNAME"
  echo "  OS: $RELEASE"
  echo
  echo "  Start Dir: $SAVEDIR"
  echo "  Base Dir: $BASEDIR"
  echo
}

function _cmdline() {
  ARGS=()
  ARGV=()
  let ARGN=0
  for ITEM in $@; do
      if [[ "$ITEM" == -* ]]; then   # alle Argumente mit beginnend mit '-' sind Options  
          ARGS+="${ITEM//-/} "       # entferne alle '-' aus $ITEM 
          continue
      fi
      PARM+="$ITEM "                 # ansonsten ist ITEM ein Parameter
      ARGN=$(( ARGN + 1 ))           # zähle Parameter
  done  
  export ARGN ARGS ARGV PARM
}

# 
# MAIN
#
_print_dir $@

_cmdline $@
echo
echo $ARGS
echo
echo $ARGV
echo
echo $PARM
echo

echo "Completed!"; echo
exit 0
