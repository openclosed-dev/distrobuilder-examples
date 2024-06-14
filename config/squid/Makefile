.PHONY: all clean

all: squid-ca.key squid-ca.csr squid-ca.crt

clean:
	rm -f squid-ca.key squid-ca.csr squid-ca.crt

squid-ca.key:
	openssl genrsa 2048 > $@

%.csr: %.conf squid-ca.key
	openssl req -new -key squid-ca.key -config $< -out $@

%.crt: %.csr squid-ca.key
	openssl x509 -req -in $< -signkey squid-ca.key -days 365 -out $@
