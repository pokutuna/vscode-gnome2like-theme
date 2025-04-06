#!/bin/bash

# This script prepares the environment for taking theme store screenshots.
# It launches VS Code in portable mode with the theme applied
# and opens sample files for capturing the screenshots.

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
PROJECT_ROOT="$( dirname "$SCRIPT_DIR" )" # Assumes script is in resources/samples
SAMPLES_DIR="$SCRIPT_DIR"

TEMP_USER_DATA_DIR=$(mktemp -d -t vscode-portable-XXXXXX)
echo "Created temporary user data directory: $TEMP_USER_DATA_DIR"

touch "$TEMP_USER_DATA_DIR/.portable"

# Read extension details from package.json
PACKAGE_JSON_PATH="$PROJECT_ROOT/package.json"
PUBLISHER=$(grep '"publisher":' "$PACKAGE_JSON_PATH" | sed 's/.*: "\(.*\)".*/\1/')
EXTENSION_NAME=$(grep '"name":' "$PACKAGE_JSON_PATH" | head -n 1 | sed 's/.*: "\(.*\)".*/\1/')
VERSION=$(grep '"version":' "$PACKAGE_JSON_PATH" | head -n 1 | sed 's/.*: "\(.*\)".*/\1/')

TEMP_EXTENSIONS_DIR="$TEMP_USER_DATA_DIR/extensions"
mkdir -p "$TEMP_EXTENSIONS_DIR"
if [ $? -ne 0 ]; then
  echo "Error creating extensions directory $TEMP_EXTENSIONS_DIR."
  rm -rf "$TEMP_USER_DATA_DIR"
  exit 1
fi

LINK_NAME="${PUBLISHER}.${EXTENSION_NAME}-${VERSION}"
LINK_PATH="$TEMP_EXTENSIONS_DIR/$LINK_NAME"
echo "Creating symlink for the theme:"
echo "  Source: $PROJECT_ROOT"
echo "  Target: $LINK_PATH"
ln -s "$PROJECT_ROOT" "$LINK_PATH"

if [ $? -ne 0 ]; then
  echo "Error creating symlink. Please check permissions and if the target path already exists."
  rm -rf "$TEMP_USER_DATA_DIR"
  exit 1
fi
echo "Symlink created successfully."

TEMP_USER_SETTINGS_DIR="$TEMP_USER_DATA_DIR/User"
mkdir -p "$TEMP_USER_SETTINGS_DIR"
SETTINGS_JSON_PATH="$TEMP_USER_SETTINGS_DIR/settings.json"
# Set theme label (hardcoded for potential debugging)
THEME_LABEL="GNOME2-like"

echo "Creating settings.json to apply the theme: $SETTINGS_JSON_PATH"
cat << EOF > "$SETTINGS_JSON_PATH"
{
    "workbench.colorTheme": "$THEME_LABEL"
}
EOF

if [ $? -ne 0 ]; then
  echo "Error creating settings.json."
  rm -rf "$TEMP_USER_DATA_DIR"
  exit 1
fi
echo "settings.json created successfully, theme set to '$THEME_LABEL'."


if ! command -v code &> /dev/null
then
    echo "'code' command could not be found. Please ensure VS Code is installed and added to your PATH."
    # Clean up temporary directory
    rm -rf "$TEMP_USER_DATA_DIR"
    exit 1
fi

code --user-data-dir="$TEMP_USER_DATA_DIR" \
    "$SAMPLES_DIR" \
    "$SAMPLES_DIR"/sample.*

echo "VS Code launched. The temporary directory $TEMP_USER_DATA_DIR will contain the portable instance's data."
echo "You may need to manually arrange the editor layout (e.g., Grid 3x2)."
echo "Remember to delete the temporary directory when finished: rm -rf $TEMP_USER_DATA_DIR"
exit 0
