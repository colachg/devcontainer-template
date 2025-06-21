# DevContainer Template

A minimal, ready-to-use development container template for any programming language or project with essential development tools and modern workflow support.

## Features

- **Clean Base Environment**: Ubuntu-based container with essential development tools
- **Docker Integration**: Docker-outside-of-Docker support for containerized workflows
- **Claude Code**: Integrated AI-powered development assistant
- **Enhanced Shell**: Starship prompt for improved terminal experience
- **SSH Integration**: Seamless SSH key mounting for Git operations
- **Flexible Configuration**: Easy to customize for any language or framework

## Quick Start

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [VS Code](https://code.visualstudio.com/) with [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

### Usage

1. **Use this template**: Click "Use this template" or clone this repository
2. **Open in VS Code**: Open the project folder in Visual Studio Code
3. **Reopen in Container**: When prompted, click "Reopen in Container" or use `Ctrl+Shift+P` → "Dev Containers: Reopen in Container"
4. **Start Developing**: The container will build and configure automatically

## What's Included

### Development Tools

- **Vim**: Terminal-based text editor
- **Starship**: Cross-shell prompt with Git integration
- **Docker**: Container runtime for development workflows

### Container Features

- **Base Image**: Ubuntu-based Microsoft Dev Container
- **User**: Non-root `vscode` user with sudo access
- **Timezone**: Asia/Tokyo (configurable in `devcontainer.json`)
- **Network**: Host network mode for seamless localhost development
- **SSH Keys**: Automatically mounted from host machine

## Configuration

### Environment Variables

Create `.devcontainer/.env` file for custom environment variables:

```bash
# Example environment variables
NODE_ENV=development
DEBUG=*
```

### Customization

Edit `.devcontainer/devcontainer.json` to:

- Change timezone in `containerEnv.TZ`
- Add VS Code extensions in `customizations.vscode.extensions`
- Add language-specific features in `features` (Node.js, Python, Go, etc.)
- Update post-creation commands in `postCreateCommand`

### Adding Language Support

Add features for your programming language in `devcontainer.json`:

```json
{
  "features": {
    "ghcr.io/devcontainers/features/node:1": {},
    "ghcr.io/devcontainers/features/python:1": {},
    "ghcr.io/devcontainers/features/go:1": {},
    "ghcr.io/devcontainers/features/docker-outside-of-docker": {},
    "ghcr.io/anthropics/devcontainer-features/claude-code:1.0": {}
  }
}
```

## Development Workflow

1. **Customize Container**: Add your language features and VS Code extensions
2. **Install Tools**: Set up your project-specific dependencies and tools
3. **Start Development**: Use your preferred build tools and scripts
4. **Version Control**: SSH keys are mounted for seamless Git operations

## File Structure

```
.
├── .devcontainer/
│   ├── devcontainer.json    # Dev container configuration
│   ├── Dockerfile          # Container build instructions
│   ├── init.sh            # Post-creation setup script
│   └── .env               # Environment variables (create as needed)
├── .gitignore             # Git ignore patterns
└── README.md              # This file
```

## Troubleshooting

### Container Won't Start
- Ensure Docker is running
- Check `.devcontainer/.env` file syntax
- Verify ports aren't already in use

### SSH Keys Not Working
- Ensure SSH keys exist in `~/.ssh/` on your host machine
- Check SSH key permissions (should be 600 for private keys)

### Performance Issues
- Consider increasing Docker memory allocation
- Use `.dockerignore` to exclude large directories

## Contributing

1. Fork this repository
2. Create your feature branch
3. Make your changes
4. Test in a fresh container
5. Submit a pull request

## Popular Language Configurations

### Node.js/TypeScript
```json
{
  "features": {
    "ghcr.io/devcontainers/features/node:1": {},
    "ghcr.io/devcontainers/features/docker-outside-of-docker": {},
    "ghcr.io/anthropics/devcontainer-features/claude-code:1.0": {}
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-vscode.vscode-typescript-next",
        "biomejs.biome"
      ]
    }
  }
}
```

### Python
```json
{
  "features": {
    "ghcr.io/devcontainers/features/python:1": {},
    "ghcr.io/devcontainers/features/docker-outside-of-docker": {},
    "ghcr.io/anthropics/devcontainer-features/claude-code:1.0": {}
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-python.python",
        "ms-python.black-formatter"
      ]
    }
  }
}
```

### Go
```json
{
  "features": {
    "ghcr.io/devcontainers/features/go:1": {},
    "ghcr.io/devcontainers/features/docker-outside-of-docker": {},
    "ghcr.io/anthropics/devcontainer-features/claude-code:1.0": {}
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "golang.go"
      ]
    }
  }
}
```

## License

This template is provided as-is for development use. Customize as needed for your projects.