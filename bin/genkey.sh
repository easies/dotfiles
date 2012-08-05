#!/bin/sh

openssl genrsa 1024 > test.key
openssl req -new -key test.key -out test.csr
openssl x509 -req -days 1 -in test.csr -signkey test.key -out test.crt
cat test.crt test.key > test.pem

