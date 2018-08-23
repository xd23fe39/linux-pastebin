#!/usr/bin/env /bin/bash

# Script constants
SHELL=$(which bash)
RELEASE=$(awk -F " " '{print $1 " " $2 " " $3 " " $4}' /etc/issue)
UNAME=$(uname -n -s -r -i)
PWD=$(pwd)
UUID=$(uuidgen)
PROGNAME=$0
SERVERTYPE=$(hostname -s | cut -c1-5)

# Script macros
LS="ls -l"
LSD="ls -D"
MKDIR="mkdir -p"
RMDIR="rm -Rf"
CPDIR="cp -R "
CCD="cd $PWD"

# Command: quick test script
function command_test() {
    echo "Your test code starts here..."
    for item in $(${LSD} /)
    do
        echo " - /"$item
    done
    echo
}

# Command: list demo
function command_list() {
    list_of_names=(\
        'Apple'\
        'Bear'\
        'Citrus'\
    )

    echo "All: ${list_of_names[@]}"; echo

    for name in ${list_of_names[@]} 
    do
        echo "Item: $name"
    done
    echo
}

# Command: show os
function command_os() {
	echo; uname -a; echo; echo "${RELEASE}"; echo
}

# Command: perform ls
function command_ls() {
	${LS}; echo
}

# Command: show usage
function command_usage() {
    echo "Usage: script-template.sh os|usage"
	echo
}

# Handling of empty command
function command_() {
    command_usage $@
}

# Standard-Ausgabe 
echo; echo "HOST: ${UNAME}"; echo

# MAIN: Aufruf von command ${1}
command_${1} $@
