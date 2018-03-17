#!/usr/bin/env /bin/bash

# Build Config
SHELL=$(which bash)
RELEASE=$(awk -F " " '{print $1 " " $2 " " $3 " " $4}' /etc/issue)
PWD=$(pwd)
MKDIR="mkdir -p"
RMDIR="rm -Rf"
CPDIR="cp -R "
BUILD="./BUILD"
TEST="./TEST"
CCD="cd $PWD"

function elementary_name() {
	echo; uname -a; echo; echo "${RELEASE}"; echo
}

function elementary_output() {
    more ${PWD}/elementary-helper.out
}

function elementary_syslog() {
    if [ "$2" == "--errors" ]; then
        dmesg | -i "error"
    else
        dmesg
    fi
}

function elementary_() {
	echo "Usage: elementary-helper.sh name|syslog|output"
	echo
}

# Standard-Ausgabe 
echo; echo "BUILD: `uname -a`"; echo

# MAIN: Aufruf von Kommando-Modul ${1}
elementary_${1} $@ | tee ${PWD}/elementary-helper.out
