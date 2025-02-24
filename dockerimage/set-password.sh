#!/bin/bash

# Check if PASSWORD environment variable is set
if [ -z "$PASSWORD" ]; then
    echo "PASSWORD environment variable is not set. Exiting."
    exit 1
fi

# Update code-server config.yaml with the password
mkdir -p ~/.config/code-server
cat <<EOF > ~/.config/code-server/config.yaml
bind-addr: 0.0.0.0:8080
auth: password
password: $PASSWORD
cert: false
EOF