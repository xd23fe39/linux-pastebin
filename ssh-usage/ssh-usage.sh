#!/bin/bash
# ssh-cheatsheet.sh

# Nicht als Script ausführen
echo "CheatSheet nicht ausführbar."; exit 1

# Wichtige Dateien und Verzeichnisse

ssh                         # OpenSSH SSH client (remote login program)
ssh-add                     # Adds private key identities to the authentication agent
ssh-agent                   # Local service for managing sessions (background)
ssh-copy-id                 # Copy SSH-Key to remote host user 
ssh-keygen                  # Create a personal SSH-Key
ssh-keyscan                 # List SSH-Keys of a remote host

~/.ssh/id_rsa               # Users personal SSH key
~/.ssh/known_hosts          # Stored known hosts
~/.ssh/config               # OpenSSH SSH client configuration files
/etc/ssh/ssh_config         # OpenSSH SSH client configuration files

# Einfache SSH Client Beispiele

ssh user@remote-host        # SSH to remote host
ssh -X user@remote-host     # SSH with X-Forwarding
ssh-keygen                  # to generaste a personal SSH-Key

# Entferne Eintrag aus der known_hosts
# Warning: the ECDSA host key for xxx differs from the key for the IP address yyy

ssh-keygen -R "hostname"    # Remove host item from known_hosts
ssh-keygen -R "ip-address"  # Remove host item based on the IP address 

# Tunneling using SSH
# See also: https://www.ssh.com/ssh/tunneling/

ssh pi@raspberry              # angenommen, sie können sich auf dem Remoteserver anmelden

                              # Auf raspberry läuft ein Webserver auf Port 443 
                              # Der Tunneleingang soll Port 3000 auf localhost lauten 
                              # dann lässt sich ein Tunnel dahin folgendermaßen aufbauen:

ssh -L 3000:localhost:443 pi@raspberry  

wget https://localhost:3000   # Nutzen kann man den Tunnel dann via localhost:3000
