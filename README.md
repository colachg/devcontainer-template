# DevContainer Template

A minimal development container template.

## Quick Start

1. Click "Use this template" or clone this repository
2. Open in VS Code
3. Click "Reopen in Container" when prompted

**Prerequisites**: [Docker](https://docs.docker.com/get-docker/) + [VS Code](https://code.visualstudio.com/) with [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## What's Included

- **Base**: Ubuntu 24.04
- **Shell**: Fish + Starship prompt
- **Tools**: Docker-outside-of-Docker, GitHub CLI

## Customization

Add language features in `.devcontainer/devcontainer.json`:

```json
{
  "features": {
    "ghcr.io/devcontainers/features/node:1": {},
    "ghcr.io/devcontainers/features/python:1": {},
    "ghcr.io/devcontainers/features/go:1": {}
  }
}
```

## File Structure

```
.devcontainer/
├── devcontainer.json   # Container configuration
├── Dockerfile          # Image definition
└── start.sh            # Starship prompt init
```
