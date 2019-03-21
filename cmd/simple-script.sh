#!/bin/env bash
# sample
# 

CURDIR=$(pwd)
BASEDIR=$(cd `dirname $0`;cd ..;pwd)
cd $BASEDIR

OPT_VERBOSE=0

source etc/sample.conf

function _usage() {
    echo "
    Simple Script - ein einfaches Bash Script

    Aufruf: $(basename $0) command args

    Commands:
    --help|-h   Anzeige dieser Information
    show|-s     Zeige Datensatz mit Key x
    "
}

function _show() { 
    if [ -z "$PASS" ]; then
        echo "Password not defined!"
        exit 1
    fi

    PNR=$(printf "%06d" ${1})   # Numerisch, 6-stellig, mit Vornullen auffüllen
    select="SELECT \`key\`, \`cn\` FROM \`people\`"
    filter="WHERE \`key\` like '%${PNR}'"
    limit="LIMIT 5"

    if [ $OPT_VERBOSE == 1 ]; then
    echo; echo "  $select $filter $limit; "; echo
    fi
    mysql -u root --password=$PASS iuam -e "$select $filter $limit;"
}

COMMAND=
ARGS=()
for parm in $@; do
    case $parm in
        --verbose|-v) OPT_VERBOSE=1;;       
        --help|-h) COMMAND='_usage';;       
        show|-s) COMMAND='_show' ;;
        *) ARGS+=($parm);;
    esac
done

${COMMAND} $ARGS

cd $CURDIR
exit 0
