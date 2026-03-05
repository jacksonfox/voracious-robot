#!/bin/bash
# Update following list from OPML export

set -e

OPML_FILE="${1:-following.opml}"
JSON_OUTPUT="data/following.json"

# Check if OPML file exists
if [ ! -f "$OPML_FILE" ]; then
    echo "Error: $OPML_FILE not found in current directory"
    echo "Please export your feeds as OPML and save as $OPML_FILE"
    exit 1
fi

# Convert OPML to JSON
echo "Converting $OPML_FILE to $JSON_OUTPUT..."
python3 convert-opml.py "$OPML_FILE" "$JSON_OUTPUT"

# Clean up OPML file
rm "$OPML_FILE"
echo "Removed temporary $OPML_FILE"

echo "Following list updated! Run './hugo server' to preview changes."