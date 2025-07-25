FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Needed to ensure both amd64 and arm64 are built.
# This arg is provided automaticlly by docker buildx.
ARG TARGETARCH

ENV NODE_OPTIONS=--use-openssl-ca
ENV NVM_DIR="/usr/local/share/nvm"

LABEL org.opencontainers.image.description="Development environment for Spotify Backstage."

# Add Zscaler CA. Useful for corporate users who utilize their SSL Inspection features.
RUN curl -k https://raw.githubusercontent.com/jhagadorn-mgm/zscaler-ca-installer/refs/heads/main/install-zscaler-ca.sh | bash

# Install latest node lts and backstage dependencies.
RUN apt-get update && \
    apt-get install -y make build-essential curl yarn python3 g++ && \
    mkdir -p /usr/local/share/nvm && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && \
    . "$NVM_DIR/nvm.sh" && \
    nvm install --lts && \
    nvm use --lts && \
    corepack enable && \
    yarn set version 4.4.1 && \
    echo 'NVM_DIR="/usr/local/share/nvm"' >> /etc/environment

RUN echo >> /home/vscode/.bashrc && \
    echo 'export NVM_DIR="/usr/local/share/nvm"' >> /home/vscode/.bashrc && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> /home/vscode/.bashrc && \ 
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> /home/vscode/.bashrc


