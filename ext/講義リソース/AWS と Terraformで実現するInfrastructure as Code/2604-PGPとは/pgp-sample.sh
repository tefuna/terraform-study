#!/bin/bash

gpg --gen-key
# REAL  : master
# EMAIL : master@sample.com

gpg --list-keys

echo "Hello World" | gpg -r master --encrypt | base64 -w0 > message.txt

cat message.txt | base64 -d | gpg -r master --decrypt

