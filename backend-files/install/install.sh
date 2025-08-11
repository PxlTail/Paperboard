clear
echo "Installing JavaScript... (Bun)"
curl -fsSL https://bun.sh/install | bash >/dev/null 2>&1

# Reload shell profile so bun is in PATH immediately
if [ -n "$BASH_VERSION" ]; then
    source ~/.bashrc
elif [ -n "$ZSH_VERSION" ]; then
    source ~/.zshrc
fi

echo "JavaScript successfully installed! Starting primary install in a few seconds."
sleep 5

curl -fsSL https://raw.githubusercontent.com/PxlTail/Paperboard/refs/heads/main/backend-files/install/install.js | bun -
