#!/bin/bash

# Start transaction
echo -e "set ssl cert /usr/local/etc/haproxy/certificates/$DOMAIN.pem <<\n$(cat /etc/letsencrypt/$DOMAIN.pem)\n" | socat tcp-connect:haproxy:9999 -

# Commit transaction
echo "commit ssl cert /usr/local/etc/haproxy/certificates/$DOMAIN.pem" | socat tcp-connect:haproxy:9999 -

# Show certification info (not essential)
echo "show ssl cert /usr/local/etc/haproxy/certificates/$DOMAIN.pem" | socat tcp-connect:haproxy:9999 -