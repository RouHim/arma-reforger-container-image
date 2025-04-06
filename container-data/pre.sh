#!/usr/bin/env sh

set -e

# Make the server executable
chmod +x $SERVER_DIR/ArmaReforgerServer

# Verify config file exists
CONFIG_FILE="$SERVER_CONFIG_DIR/config.json"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Config file not found: $CONFIG_FILE"
    exit 1
fi