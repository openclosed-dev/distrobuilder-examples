#!/bin/bash

set -eu

# Generates CA certificate
make --directory=config/squid

sudo cp config/squid/squid.conf /etc/squid/

sudo mkdir -p /etc/squid/ssl 
sudo cp config/squid/squid-ca.{key,crt} /etc/squid/ssl/

sudo cp /etc/squid/ssl/squid-ca.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates

sudo -u proxy mkdir -p /var/cache/squid

sudo rm -rf /var/cache/ssl_db
sudo /usr/lib/squid/security_file_certgen -c -s /var/cache/ssl_db -M 20MB
sudo chown proxy:proxy -R /var/cache/ssl_db

# Restarts Squid
sudo systemctl restart squid
