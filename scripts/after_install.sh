#!/bin/bash

# Get a token for IMDSv2
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Check if the TOKEN was successfully fetched
if [ -z "$TOKEN" ]; then
    echo "Failed to fetch the IMDSv2 token."
    exit 1
fi

# Fetch the private IP address using the token
PRIVATE_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)

# Check if the PRIVATE_IP was successfully fetched
if [ -z "$PRIVATE_IP" ]; then
    echo "Failed to fetch the private IP address from the metadata service."
    exit 1
fi

echo "Fetched private IP address: $PRIVATE_IP"

# Define the NGINX configuration file path
NGINX_CONF="/etc/nginx/conf.d/node-app-nginx.conf"

# Check if the NGINX configuration file exists
if [ ! -f "$NGINX_CONF" ]; then
    echo "NGINX configuration file $NGINX_CONF does not exist."
    exit 1
fi

# Replace the text 'SERVER_IP' with the fetched private IP address
sed -i "s/SERVER_IP/$PRIVATE_IP/g" "$NGINX_CONF"

echo "Replaced SERVER_IP with $PRIVATE_IP in $NGINX_CONF"
