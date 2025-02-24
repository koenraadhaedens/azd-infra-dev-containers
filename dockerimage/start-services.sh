#!/bin/bash

# Set the code-server password
/usr/local/bin/set-password.sh

# Start Nginx
service nginx start

# Start code-server
code-server --bind-addr 0.0.0.0:8080