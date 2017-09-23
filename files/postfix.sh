#!/bin/bash

echo "Configuring configuration overrides for docker."

# Disable SMTPUTF8, because libraries (ICU) are missing in alpine
postconf -e smtputf8_enable=no

# Update aliases database. It's not used, but postfix complains if the .db file is missing
postalias /etc/postfix/aliases

# Prevent odd locking issues on mounts in kubernetes.
echo "Creating tmp directory for pid files."
mount -t tmpfs -o size=100M,mode=0755 tmpfs /var/spool/postfix/pid/

echo "Using the following configurations:"
echo "Configurations start."
postconf -n
echo "Configurations end."

echo "Starting postfix, which will fork into the background."
/usr/sbin/postfix -c /etc/postfix start