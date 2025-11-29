FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install essential packages
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -qyy && \
    apt-get upgrade -qyy && \
    apt-get install -qyy vim \
    && apt-get auto-remove -yqq \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Install starship.rs
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Create workspace directory
RUN mkdir -p /workspace && chown vscode:vscode /workspace

# Set environment variables
ENV NODE_ENV=development
USER vscode
WORKDIR /workspace
