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



echo "Operation completed."
