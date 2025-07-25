FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:18

ENV NVM_DIR="/usr/local/share/nvm"

# Install latest node lts and backstage dependencies.
RUN apt-get update && \
    apt-get install -y make build-essential curl yarn python3 g++ && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && \
    . "$NVM_DIR/nvm.sh" && \
    nvm install --lts && \
    nvm use --lts && \
    corepack enable && \
    yarn set version 4.4.1 

