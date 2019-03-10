#!/usr/bin/env bash
#
# BASH-SCRIPTS (BSH)
# Module: empty.sh

# Parameter File
PARMLIST=data.txt

# Template String mit {1}-Platzhalter
TEMPLATE="THIS IS THE {1} OUTPUT!"

# Selector
SELECTOR='^12.$'

# Scriptname 
SCRIPTNAME=$(basename $0)

# Aktuelles Verzeichnis merken
PWD=$(pwd)

# Basedir ermitteln und setzen
# BASEDIR=$(cd `dirname $0`; cd ..; pwd)
BASEDIR=$(cd `dirname $0`; pwd)
cd ${BASEDIR}

# Include configuration file
source 'conf/bash-scripts.conf' include_once
source ${BSHFILE} include_once

# Substituiere Platzhalter in Template String
#
# Aufruf: _subst "$TEMPLATE" "$WERT"
#
# $1: Template String mit {1}-Platzhalter
# $2: Wert für Platzhalter
#
_subst() {
    template=$1   # hole Template und
    shift         # shifte Parameterliste
    value=$1      # hole Wert
    shift         # shifte Parameterliste
    STR=$(echo "$template" | sed "s/{1}/$value/")
    echo -n $STR
}

##
# MAIN Program
#
_main() {
    echo "SCRIPTNAME: ${SCRIPTNAME}"
    echo "==="
    echo "BASEDIR: ${BASEDIR}"
    echo "TEMPLATE: ${TEMPLATE}"
    echo "PARMLIST: ${PARMLIST}"
    echo "SELECTOR: ${SELECTOR}"
    echo "${BSHFILE}"
    echo "==="
    for i in $(cat $PARMLIST); do 
        echo -n $i ": "
        if [[ $i =~ $SELECTOR ]]; then
            echo -n $i
            echo -n " => "; _subst "$TEMPLATE" $i
        else
            echo -n "Ignore."
        fi
        echo
    done
    echo "==="
    return 0
}

_main $@