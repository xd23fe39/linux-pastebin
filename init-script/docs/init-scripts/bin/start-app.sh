#!/bin/bash
#
# 2016 by FRANK. 
#
# This script is only supportet on LINUX systems!

# INIT Script hinzufügen/aktivieren
#
# cp init-script.sh /etc/init.d/init-script
# chkconfig --add start-app
# chkconfig start-app on 

### BEGIN INIT INFO
# Provides: start-app
# Required-Start: $local_fs $remote_fs $network
# Required-Stop:  $local_fs $remote_fs $network
# Should-Start: cron sendmail postfix
# Default-Start:  3 5
# Default-Stop:   0 1 2 6
# Description:    Starts an app with username 'app'
### END INIT INFO  

# Script-Beschreibung
DESCRIPTION="INIT Script Demo"

# SCRIPT_DIR setzen
SCRIPT_DIR="`dirname $0`"

# SCRIPT_DIR setzen
SCRIPT_NAME="`basename $0`"

# BASEDIR setzen
BASEDIR="`dirname $0`/.."

# Logfile
LOGFILE="~/log/${SCRIPT_NAME}.log"

# Hostname/Nodename holen
HOSTNAME=$(hostname)

# UID des aktuell angemeldeten Benutzers holen
LOGONUSER=${UID}

# Einrückung festlegen
TAB="  "

# Start-Stop-Script zum starten des SAP Netweaver Adapters 
START_STOP_SCRIPT=/home/my/app
START_STOP_HOME=/home/my
START_STOP_USER=9998
START_STOP_UNAME=app
START_STOP_PROFILE=~/.bash_profile 

BUILD_COMMAND="`which su` - $START_STOP_UNAME -s `which bash` -c "

# ---------------------------------------------------------
# - Ausgabe von Informationen zum Script bzw. dessen akt. 
# - Umgebung
# -
function run_info {
	echo
	echo $DESCRIPTION
	echo
	echo "           Hostname:  $HOSTNAME"
	echo "         Logon User:  $LOGONUSER"
	echo "  Start-Stop-Script:  $START_STOP_SCRIPT"
	echo "    Start-Stop-User:  $START_STOP_USER"
	echo " Start-Stop-Profile:  $START_STOP_PROFILE"
	echo "           Log File:  $LOGFILE"
	echo
	echo " Command Preview:"
	echo "   $BUILD_COMMAND \"cd $START_STOP_HOME; ${START_STOP_SCRIPT} [start|stop]\" "
	echo	
}

# ---------------------------------------------------------
# - Anzeige des aktuellen Status

function run_status {
	STATUS="OK"
	if [ ! -f "$START_STOP_SCRIPT" ] 
	then
			STATUS="FAILURE"
			echo "Start-Stop-Script $START_STOP_SCRIPT not found!"
	fi
	if [ "$LOGONUSER" != "$START_STOP_USER" ] 
	then
			STATUS="FAILURE"
			echo "Logon User $LOGONUSER will be switched to user [$START_STOP_USER:$START_STOP_UNAME]! "
	fi
	if [ ! -f "$START_STOP_PROFILE" ]
	then
		STATUS="FAILURE"
		echo "Start-Stop User Profile [$START_STOP_USER] not found!"
	fi	
}

# ---------------------------------------------------------
# - Start

function run_start {
	$BUILD_COMMAND "cd $START_STOP_HOME; ${START_STOP_SCRIPT} start" 
}

# ---------------------------------------------------------
# - Stop

function run_stop {
	$BUILD_COMMAND "cd $START_STOP_HOME; ${START_STOP_SCRIPT} stop" 
}

# ---------------------------------------------------------
# - Hauptprozedure / Hauptprogramm / main

case "$1" in
    start)
			run_start $@
      ;;
    stop)
			run_stop $@
      ;;
		info)
			run_info
			;;
    status)
				run_status
				if [ "$STATUS" == "OK" ]
				then
					echo "OK"
					exit 0
				else
					echo "FAILURE"
					exit 1
				fi
        ;;
    reload|restart)
      $0 stop
      $0 start
      ;;
    *)
      echo "${TAB}Usage: $0 start|stop|restart|reload|info|status"
			echo
      exit 1
esac
exit 0
