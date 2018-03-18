#!/bin/bash
#
# 2016 by FRANK. 
#
# This script is only supportet on LINUX systems!

# SCRIPT_DIR setzen
SCRIPT_DIR="`dirname $0`"

# SCRIPT_DIR setzen
SCRIPT_NAME="`basename $0`"

# BASEDIR setzen
BASEDIR="`dirname $0`/.."

# Logfile
LOGFILE="${SCRIPT_NAME}.log"

# Hostname/Nodename holen
HOSTNAME=$(hostname)

# UID des aktuell angemeldeten Benutzers holen (Solaris)
LOGONUSER=${UID}

# Einrückung festlegen
TAB="  "

# ---------------------------------------------------------
# - Sample function 
# -
function run_info {
	INFOTXT="`uname -a`"
	echo ${TAB}INFO: ${INFOTXT}
}

case "$1" in
    start)
			echo "OK"
      ;;
    stop)
      echo "OK"
      ;;
		info)
      echo "This is a template script!"
			;;
    status)
      echo "This is a template script!"
        ;;
    reload|restart)
      $0 stop
      $0 start
      ;;
    *)
      echo "${TAB}Usage: $0 start|stop|restart|reload|info|status"
      exit 1
esac
exit 0
