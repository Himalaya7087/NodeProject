#!/bin/bash

service nginx stop

# Remove the existing nginx configuration file if it exists
if [ -f /etc/nginx/conf.d/node-app-nginx.conf ]; then
    rm -rf /etc/nginx/conf.d/node-app-nginx.conf
fi