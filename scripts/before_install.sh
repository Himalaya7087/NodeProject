#!/bin/bash

# Define the directory path
DIR="/var/www/node-app"

# Check if the directory exists
if [ -d "$DIR" ]; then
    echo "Directory $DIR exists. Removing all files in it..."
    rm -rf ${DIR:?}/*
else
    echo "Directory $DIR does not exist. Creating the directory..."
    mkdir -p "$DIR"
fi

# Remove the existing nginx configuration file if it exists
if [ -f /etc/nginx/conf.d/node-app-nginx.conf ]; then
    rm /etc/nginx/conf.d/node-app-nginx.conf
fi

echo "Operation completed."
