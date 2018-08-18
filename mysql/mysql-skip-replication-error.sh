CHECKHOST='MYSQL-SLAVE'

USER=$1
PASS=$2
SKIP=$3

HOST=$(hostname -s)
IP=$(hostname -i)
CMD="mysql --user=$USER --password=$PASS -e"

if [ "$CHECKHOST" != "$HOST" ]; then
    echo; echo "Kein MySQL SLAVE!"; echo
    exit 1
fi

echo; echo "MySQL: Skip Replication Error on $HOST ($IP)"; echo

if [ "$SKIP" != "yes" ]; then
    $CMD 'SHOW STATUS\G'
    echo; echo "  Usage: CMD user pass yes to skip error!"; echo
    exit 2
fi

$CMD 'STOP SLAVE'
$CMD 'SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1'
$CMD 'START SLAVE'
$CMD 'SHOW STATUS\G'
