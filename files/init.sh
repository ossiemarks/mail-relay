#!/bin/bash

CONFIG_SCRIPT="/config.sh"

if [ -f $CONFIG_SCRIPT ]; then
    echo "$CONFIG_SCRIPT found, will run."
    /bin/bash $CONFIG_SCRIPT
    echo "Script executed and exited with code $?."
else
    echo "$CONFIG_SCRIPT not found, will not run."
fi

echo "Starting Supervisor."
/usr/bin/supervisord -c /etc/supervisord.conf