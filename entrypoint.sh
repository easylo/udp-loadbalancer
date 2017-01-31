#!/bin/bash
set -e

if [ "$NAMESERVER" == "" ]; then
    export NAMESERVER=`cat /etc/resolv.conf | grep "nameserver" | awk '{print $2}' | tr '\n' ' '`
fi

echo "Nameserver is: $NAMESERVER"

echo "Copying nginx config"
envsubst < /nginx.conf >> /etc/nginx/nginx.conf

echo "Starting nginx"
nginx -g "daemon off;"
