#!/bin/zsh

# Fix permissions for the SSH agent socket.
if [ -n "$SSH_AUTH_SOCK" ]; then
    echo "SSH agent socket found at: $SSH_AUTH_SOCK"
    chown -R vscode:vscode "$SSH_AUTH_SOCK"
else
    echo "SSH_AUTH_SOCK not set."
fi

# Configure git from host gitconfig
if command -v git >/dev/null 2>&1; then
    if [ -f "/tmp/host.gitconfig" ]; then
        cp /tmp/host.gitconfig ~/.gitconfig
        # The host gpg.ssh.program might point to a path that doesn't exist in the container.
        # Unset it to allow the agent to work correctly.
        git config --global --unset-all gpg.ssh.program || true
    fi
else
    echo "Git not found. Skipping git configuration."
fi

# setup starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
if [ -n "$SSH_AUTH_SOCK" ]; then
    echo "export SSH_AUTH_SOCK=${SSH_AUTH_SOCK}" >> ~/.zshrc
fi