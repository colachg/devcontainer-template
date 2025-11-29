#!/bin/fish

# unset git gpg sign program
git config --global --unset gpg.ssh.program || true
git config --global gpg.ssh.allowedSignersFile ~/.ssh/allowed_signers || true
