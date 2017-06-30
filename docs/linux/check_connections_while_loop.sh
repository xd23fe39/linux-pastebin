#!/usr/bin/bash
#
# Prüft alle 2 Sekunden die Verbindungen zu Host $1

function check_connection {
  echo -n "  * "
  echo -n "`netstat -na | grep ${1}`"
  echo " - ${1} "
}

while [ true ]
do
  check_connection ${1}
  sleep 2
done

exit 0
