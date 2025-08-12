#!/usr/bin/env bash
set -euo pipefail
clear

# 1) Ensure unzip (Bun installer needs it)
if ! command -v unzip >/dev/null 2>&1; then
    echo "Installing unzip..."
    sudo apt-get update -y >/dev/null 2>&1
    sudo apt-get install -y unzip >/dev/null 2>&1
fi

# 2) Install Bun to ~/.bun
echo "Installing JavaScript... (Bun)"
curl -fsSL https://bun.sh/install | bash

# 3) Move Bun to a system-wide location and symlink
echo "Promoting Bun to system-wide..."
sudo rm -rf /usr/local/bun
sudo mv "$HOME/.bun" /usr/local/bun
sudo ln -sf /usr/local/bun/bin/bun /usr/local/bin/bun

# 4) Sanity check (should print a version)
echo "Bun is now at: $(command -v bun)"
bun -v

echo "JavaScript successfully installed! Starting primary install in a few seconds."
sleep 2

# 5) Run your primary installer using Bun (absolute path is extra-safe)
curl -fsSL https://raw.githubusercontent.com/PxlTail/Paperboard/refs/heads/main/backend-files/install/install.js | /usr/local/bin/bun -
