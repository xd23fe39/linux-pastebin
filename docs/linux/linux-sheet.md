# Linux Command Sheet

#### Prozesse

iostat | ps | top | vmstat

#### Dateien 	

chgrp | chown | chmod | cp | dd | df | dir | dircolors | install | ln | ls | mkdir | mkfifo | mknod | mv | rm | rmdir | shred | sync | touch | vdir

#### Text 	

cat | cksum | comm | csplit | cut | expand | fmt | fold | head | join | md5sum | nl | od | paste | ptx | pr | sha1sum | sort | split | sum | tac | tail | tr | tsort | unexpand | uniq | wc

#### Shell 	

basename | chroot | date | dirname | du | echo | env | expr | factor | false | groups | hostid | id | link | logname | nice | nohup | pathchk | pinky | printenv | printf | pwd | readlink | seq | sleep | stat | stty | tee | test | true | tty | uname | unlink | users | who | whoami | yes | $0, $?

#### Netzwerk

arp | ifconfig | iwconfig | man interfaces | netstat | ping | tcpdump | telnet | traceroute | 

## Beispiel

```
# SCRIPT_DIR setzen
SCRIPT_DIR="`dirname $0`"

# SCRIPT_DIR setzen
SCRIPT_NAME="`basename $0`"

printenv LANG
```
``` 
history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10
``` 
