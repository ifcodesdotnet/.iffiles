#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

# Installs PowerShell on Debian 13.
#
# Official documentation:
# https://learn.microsoft.com/en-us/powershell/scripting/install/install-debian

# Validate operating system.
source /etc/os-release

if [[ "$ID" != "debian" || "$VERSION_ID" != "13" ]]; then
    echo "Error: This script requires Debian 13." >&2
    exit 1
fi

# Install prerequisites.
echo "Installing prerequisites..."
sudo apt-get update
sudo apt-get install --yes wget ca-certificates

# Create a temporary directory.
TEMP_DIR=$(mktemp --directory)
trap 'rm --recursive --force "$TEMP_DIR"' EXIT

# Download Microsoft's repository package.
echo "Downloading Microsoft repository package..."
wget --quiet \
    https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb \
    --output-document="$TEMP_DIR/packages-microsoft-prod.deb"

# Register Microsoft's APT repository.
echo "Registering Microsoft repository..."
sudo dpkg --install "$TEMP_DIR/packages-microsoft-prod.deb"

# Install PowerShell.
echo "Installing PowerShell..."
sudo apt-get update
sudo apt-get install --yes powershell

# Verify installation.
echo "PowerShell installed successfully."
pwsh --version