#!/bin/sh

#
# Script options (exit script on command fail).
#
set -e

#
# Define default Variables.
#
USER="named"
GROUP="named"

#
# Set owner and permissions.
#

echo "Set owner and permissions... "
chown -R ${USER}:${GROUP} /var/bind /etc/bind /var/run/named /var/log/named /var/cache/bind
chmod -R o-rwx /var/bind /etc/bind /var/run/named /var/log/named
