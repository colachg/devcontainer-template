#!/bin/zsh

# Fix permissions for the SSH agent socket.
if [ -n "$SSH_AUTH_SOCK" ]; then
    echo "SSH agent socket found at: $SSH_AUTH_SOCK"
    chown -R vscode:vscode "$SSH_AUTH_SOCK"
else
    echo "SSH_AUTH_SOCK not set."
fi

# Configure git user from host gitconfig
if command -v git >/dev/null 2>&1; then
    if [ -f "/tmp/host.gitconfig" ]; then
        GIT_USER_NAME=$(git config --file /tmp/host.gitconfig user.name)
        GIT_USER_EMAIL=$(git config --file /tmp/host.gitconfig user.email)

        if [ -n "$GIT_USER_NAME" ]; then
            git config --global user.name "$GIT_USER_NAME"
        fi
        if [ -n "$GIT_USER_EMAIL" ]; then
            git config --global user.email "$GIT_USER_EMAIL"
        fi
    fi

    # Configure Git signing key from 1Password SSH Agent on terminal startup
    if command -v ssh-add >/dev/null 2>&1 && ssh-add -l >/dev/null 2>&1; then
        SIGNING_KEY=$(ssh-add -L | head -n 1)
        if [ -n "$SIGNING_KEY" ]; then
            git config --global user.signingkey "$SIGNING_KEY"
        fi
        git config --global commit.gpgsign true
        git config --global gpg.format ssh
    fi
else
    echo "Git not found. Skipping git configuration."
fi

# setup starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
if [ -n "$SSH_AUTH_SOCK" ]; then
    echo "export SSH_AUTH_SOCK=${SSH_AUTH_SOCK}" >> ~/.zshrc
fi