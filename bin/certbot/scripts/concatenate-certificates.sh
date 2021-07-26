#!/bin/bash

if [ -f /etc/letsencrypt/live/$DOMAIN/fullchain.pem -a -f /etc/letsencrypt/live/$DOMAIN/privkey.pem ]; then
  cat /etc/letsencrypt/live/$DOMAIN/fullchain.pem /etc/letsencrypt/live/$DOMAIN/privkey.pem > /etc/letsencrypt/$DOMAIN.pem
fi