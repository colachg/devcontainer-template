#!/bin/bash
set -e

# Setup starship
if command -v starship >/dev/null 2>&1; then
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    echo "✅ Starship configured"
else
    echo "❌ Starship not found"
fi

# Copy git config from mounted location if it exists
if [ -f /tmp/host.gitconfig ]; then
    cp /tmp/host.gitconfig ~/.gitconfig
    echo "✅ Git config copied"
fi

echo "🎉 DevContainer initialization complete!"
