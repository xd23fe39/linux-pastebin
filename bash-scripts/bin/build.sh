#!/usr/bin/env bash
#
# BASH-SCRIPTS (BSH)
# Module: empty.sh

# Aktuelles Verzeichnis merken
PWD=$(pwd)

# Basedir ermitteln und setzen
BASEDIR=$(cd `dirname $0`; cd ..; pwd)
cd ${BASEDIR}

# Include configuration file
source 'conf/bash-scripts.conf' include_once
source ${BSHFILE} include_once

write_shebang() {
    echo "#!$(which env) bash"
    echo "#"
    echo "# Generator: $(basename $0)@$(hostname)"
    echo "#"
    echo
}

write_eof() {
    echo "#"
    echo "#EOF!"
}

write_basedir() {
    echo "# Basedir ermitteln und setzen
BASEDIR=\$(cd \`dirname \$0\`; cd ..; pwd)
cd \${BASEDIR}
"
}

write_main() {
    echo "##"
    echo "# MAIN Program"
    echo "#"
    echo "_main() {

    # Write your code here!
    echo \"BASEDIR=\$BASEDIR\"
    echo 

}

_main \$@ 
"
}

##
# MAIN Program
#
_main() {
    write_shebang $@
    write_basedir $@
    write_main $@
    write_eof $@
    return 0
}

_main $@