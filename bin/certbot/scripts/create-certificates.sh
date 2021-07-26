#!/bin/bash

# Building args
args=( \
 "--standalone" \
 "--non-interactive" \
 "--agree-tos" \
 "--email=$EMAIL" \
 "--http-01-port=$CERTBOT_PORT" \
 "--cert-name=$DOMAIN" \
 "-d=$DOMAIN"
)

if [ "$STAGING" == "true" ]; then args+=( "--staging" ); fi
if [ "$FORCE_RENEWAL" == "true" ]; then args+=( "--force-renewal" ); fi

# Request certificates
certbot certonly "${args[@]}" && \

# Concatenate certificates
. /etc/scripts/concatenate-certificates.sh && \

# Update certificates in HAProxy
. /etc/scripts/update-haproxy-certificates.sh