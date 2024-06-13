#!/bin/bash

set -eu

pushd config/squid
rm -f *.key *.csr *.crt
openssl genrsa 2048 > squid-ca.key
openssl req -new -key squid-ca.key -config squid-ca.conf -out squid-ca.csr
openssl x509 -req -in squid-ca.csr -signkey squid-ca.key -days 365 -out squid-ca.crt
popd

sudo cp config/squid/squid.conf /etc/squid/

sudo mkdir -p /etc/squid/ssl 
sudo cp config/squid/squid-ca.{key,crt} /etc/squid/ssl/

sudo cp /etc/squid/ssl/squid-ca.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates

sudo -u proxy mkdir -p /var/cache/squid

sudo rm -rf /var/cache/ssl_db
sudo /usr/lib/squid/security_file_certgen -c -s /var/cache/ssl_db -M 20MB
sudo chown proxy:proxy -R /var/cache/ssl_db
