#!/bin/bash

mkdir -p ./root/etc/nginx/certs

openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out ./root/etc/nginx/certs/firefly-iii.crt \
            -keyout ./root/etc/nginx/certs/firefly-iii.key