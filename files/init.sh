#!/bin/bash

CONFIG_SCRIPT="/config.sh"

if [ -f $CONFIG_SCRIPT ]; then
    echo "Config script $CONFIG_SCRIPT found, will run."
    /bin/bash $CONFIG_SCRIPT
    echo "Script executed and exited with code $?."
else
    echo "Config script $CONFIG_SCRIPT not found, will not run."
fi

echo "Starting Supervisor."
/usr/bin/supervisord -c /etc/supervisord.conf