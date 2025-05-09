#!/bin/bash
# Script to start a preview server for a Marp presentation
# Usage: ./scripts/watch.sh presentation-folder-name

# Check if presentation name is provided
if [ -z "$1" ]; then
  echo "Error: Please provide a presentation folder name"
  echo "Usage: ./scripts/watch.sh presentation-folder-name"
  exit 1
fi

PRESENTATION=$1
THEME_PATH="./themes/devslopes.css"
PRESENTATION_PATH="presentations/$PRESENTATION"
PRESENTATION_FILE="$PRESENTATION_PATH/$PRESENTATION.md"

# Check if presentation folder exists
if [ ! -d "$PRESENTATION_PATH" ]; then
  echo "Error: Presentation folder '$PRESENTATION_PATH' not found"
  exit 1
fi

# Check if presentation file exists
if [ ! -f "$PRESENTATION_FILE" ]; then
  # Look for any .md file in the presentation folder
  MD_FILE=$(find "$PRESENTATION_PATH" -name "*.md" -type f | head -n 1)
  
  if [ -z "$MD_FILE" ]; then
    echo "Error: No markdown file found in '$PRESENTATION_PATH'"
    exit 1
  else
    PRESENTATION_FILE=$MD_FILE
    echo "Using markdown file: $PRESENTATION_FILE"
  fi
fi

echo "Starting preview server for: $PRESENTATION_FILE"
echo "Using theme: $THEME_PATH"
echo "Press Ctrl+C to stop the server"

# Start preview server
marp -p --theme-set "./$(dirname "$THEME_PATH")" --theme "devslopes" --allow-local-files "$PRESENTATION_FILE"