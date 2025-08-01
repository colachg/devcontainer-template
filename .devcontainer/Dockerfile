FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install essential packages
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update -qyy && \
    apt install -qyy vim \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Install starship.rs
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Create workspace directory
RUN mkdir -p /workspace && chown vscode:vscode /workspace

# Set environment variables
ENV NODE_ENV=development
ENV SHELL=/bin/zsh
