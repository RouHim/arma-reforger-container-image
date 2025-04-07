#!/usr/bin/env sh

set -e

# Create $MODS_TEMP_DIR if it doesn't exist
if [ ! -d "$MODS_TEMP_DIR" ]; then
    mkdir -p "$MODS_TEMP_DIR"
    chmod 777 "$MODS_TEMP_DIR"
fi

# Make the server executable
chmod +x "$SERVER_DIR/ArmaReforgerServer"

# Verify config file exists
CONFIG_FILE="$SERVER_CONFIG_DIR/config.json"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Config file not found: $CONFIG_FILE"
    exit 1
fi