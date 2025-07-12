#!/bin/zsh

# Fix permissions for the SSH agent socket.
if [ -n "$SSH_AUTH_SOCK" ]; then
    sudo chown -R vscode:vscode "$SSH_AUTH_SOCK"
else
    echo "SSH_AUTH_SOCK not set."
fi

# Configure git from host gitconfig
if [ -f "/tmp/host.gitconfig" ]; then
    cp /tmp/host.gitconfig ~/.gitconfig
fi

# setup starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
echo 'export SSH_AUTH_SOCK=/run/host-services/ssh-auth.sock' >> ~/.zshrc