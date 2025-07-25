# DevPod Backstage

[![Build and Push Image](https://github.com/dahui/devpod-backstage/actions/workflows/build.yaml/badge.svg)](https://github.com/dahui/devpod-backstage/actions/workflows/build.yaml)
[![License: MPL 2.0](https://img.shields.io/badge/License-MPL_2.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)
[![Docker Pulls](https://img.shields.io/docker/pulls/ghcr.io/dahui/devpod-backstage)](https://ghcr.io/dahui/devpod-backstage)

A pre-configured DevPod container optimized for [Backstage](https://backstage.io/) development with Node.js 18 LTS and essential build tools.

## Features

- 🚀 **Node.js 18 LTS** with NVM for version management
- 📦 **Yarn 4.4.1** with Corepack enabled
- 🛠️ **Build essentials** (make, g++, python3)
- 🐳 **Multi-architecture support** (AMD64, ARM64)
- ⚡ **VS Code Dev Container** compatible

## Quick Start

### Using with DevPod

```bash
devpod up ghcr.io/dahui/devpod-backstage:latest
```

### Using with Docker

```bash
docker run -it --rm ghcr.io/dahui/devpod-backstage:latest
```

### Creating a new Backstage app

```bash
# Inside the container
npx @backstage/create-app@latest my-backstage-app
cd my-backstage-app
yarn dev
```

## What's Included

| Tool | Version | Purpose |
|------|---------|----------|
| Node.js | 18 LTS | JavaScript runtime |
| Yarn | 4.4.1 | Package manager |
| NVM | 0.40.3 | Node version manager |
| Python | 3.x | Build dependencies |
| Make | Latest | Build tool |
| G++ | Latest | C++ compiler |

## Container Registry

Images are automatically built and published to GitHub Container Registry:

- **Latest**: `ghcr.io/dahui/devpod-backstage:latest`
- **Tagged releases**: `ghcr.io/dahui/devpod-backstage:<tag>`

## Development

### Building locally

```bash
git clone https://github.com/dahui/devpod-backstage.git
cd devpod-backstage
docker build -t devpod-backstage .
```

### Testing the container

```bash
docker run -it --rm devpod-backstage node --version
docker run -it --rm devpod-backstage yarn --version
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test the container builds successfully
5. Submit a pull request

## License

This project is licensed under the Mozilla Public License 2.0 - see the [LICENSE](LICENSE) file for details.

## Related Projects

- [Backstage](https://backstage.io/) - Platform for building developer portals
- [DevPod](https://devpod.sh/) - Codespaces but open-source
- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers) - Development containers for VS Code
