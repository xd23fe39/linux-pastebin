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

$HOME/.ssh/id_rsa           # Users personal SSH key
$HOME/.ssh/known_hosts      # Stored known hosts
/etc/ssh/ssh_config         # SSH server configuration

# Einfache SSH Client Beispiele

ssh user@remote-host        # SSH to remote host
ssh -X user@remote-host     # SSH with X-Forwarding
ssh-keygen                  # to generaste a personal SSH-Key

# Entferne Eintrag aus der known_hosts

ssh-keygen -R "hostname"    # Remove host item from known_hosts
