#!/bin/bash
# Script to build a Marp presentation into PDF
# Usage: ./scripts/build.sh presentation-folder-name

# Check if presentation name is provided
if [ -z "$1" ]; then
  echo "Error: Please provide a presentation folder name"
  echo "Usage: ./scripts/build.sh presentation-folder-name"
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

# Create output directory if it doesn't exist
mkdir -p "$PRESENTATION_PATH/output"

# Get the base filename without extension
FILENAME=$(basename "$PRESENTATION_FILE" .md)
OUTPUT_PDF="$PRESENTATION_PATH/output/$FILENAME.pdf"

echo "Building presentation: $PRESENTATION_FILE"
echo "Using theme: $THEME_PATH"
echo "Output PDF: $OUTPUT_PDF"

# Generate PDF
marp --theme-set "./$(dirname "$THEME_PATH")" --theme "devslopes" --allow-local-files --pdf "$PRESENTATION_FILE" -o "$OUTPUT_PDF"

# Check if build was successful
if [ $? -eq 0 ]; then
  echo "✅ PDF successfully generated: $OUTPUT_PDF"
  
  # Open PDF (uncomment the line for your OS)
  # For macOS:
  open "$OUTPUT_PDF"
  # For Linux:
  # xdg-open "$OUTPUT_PDF"
  # For Windows (WSL):
  # explorer.exe `wslpath -w "$OUTPUT_PDF"`
else
  echo "❌ Error generating PDF"
fi