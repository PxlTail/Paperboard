clear
if ! command -v unzip >/dev/null 2>&1; then
    echo "Installing unzip..."
    sudo apt-get update -y >/dev/null 2>&1
    sudo apt-get install -y unzip >/dev/null 2>&1
fi
echo "Installing JavaScript... (Bun)"
curl -fsSL https://bun.sh/install | bash

# Reload shell profile so bun is in PATH immediately
if [ -n "$BASH_VERSION" ]; then
    source ~/.bashrc
elif [ -n "$ZSH_VERSION" ]; then
    source ~/.zshrc
fi

echo "JavaScript successfully installed! Starting primary install in a few seconds."
sleep 5

curl -fsSL https://raw.githubusercontent.com/PxlTail/Paperboard/refs/heads/main/backend-files/install/install.js | bun -
