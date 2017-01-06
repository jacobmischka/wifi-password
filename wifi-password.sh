#!/bin/sh

CONNECTIONS_PATH="/etc/NetworkManager/system-connections"

SSID=$(iwgetid -r)

if [  "$1" ]; then
	SSID=$1
fi

if [ -e "$CONNECTIONS_PATH/$SSID" ]; then
	sudo cat "$CONNECTIONS_PATH/$SSID" | grep psk= | sed s/psk=//
else
	echo "No record found for $SSID"
fi
