#!/bin/bash

PWD=$(pwd)

function oper_help() {
    echo "
    Usage: create-script all|env|head|help

    Erstelle ein neues Script: 
       create-script all > demo.sh
    "
    echo
}

function oper_head() {
    echo "#!"$(which bash)
    echo "# Build:" $(uname -n -m -r -o) "$USER@$HOSTNAME"
    echo
}

function oper_env() {
    echo "SHELL=$SHELL"
    echo "PATH=$PATH"
    echo "LANG=$LANG"
    echo "HOSTNAME=$HOSTNAME"
    echo "HOME=$HOME"
    echo "PWD=$PWD"
}

function oper_main() {
    echo "
function oper_uname() {
    uname -a
}

# MAIN Program 
oper_\${1}
"
}

function oper_all() {
    oper_head
    oper_env
    oper_main
    echo
}

function oper_() {
    oper_help
}

# MAIN Program
oper_${1} $@