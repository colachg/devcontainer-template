#!/bin/zsh

git config --global --unset-all gpg.ssh.program || true
git config --global gpg.ssh.allowedSignersFile ~/.ssh/allowed_signers || true

# This script runs on every container start.
source ~/.zshrc