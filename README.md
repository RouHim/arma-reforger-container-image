<p align="center">
  <img src="https://raw.githubusercontent.com/RouHim/arma-reforger-container-image/main/.github/readme/logo.png" width="250">
</p>

<p align="center">
    <a href="https://github.com/RouHim/arma-reforger-container-image/actions/workflows/pipeline.yml"><img src="https://github.com/RouHim/arma-reforger-container-image/actions/workflows/pipeline.yml/badge.svg?branch=main" alt="Pipeline"></a>
    <a href="https://github.com/RouHim/arma-reforger-container-image/actions/workflows/scheduled-security-audit.yaml"><img src="https://github.com/RouHim/arma-reforger-container-image/actions/workflows/scheduled-security-audit.yaml/badge.svg?branch=main" alt="Pipeline"></a>
    <a href="https://hub.docker.com/r/rouhim/arma-reforger-server"><img src="https://img.shields.io/docker/pulls/rouhim/arma-reforger-server.svg" alt="Docker Hub pulls"></a>
    <a href="https://hub.docker.com/r/rouhim/arma-reforger-server"><img src="https://img.shields.io/docker/image-size/rouhim/arma-reforger-server" alt="Docker Hub size"></a>
    <a href="https://github.com/aquasecurity/trivy"><img src="https://img.shields.io/badge/trivy-protected-blue" alt="trivy"></a>
    <a href="https://hub.docker.com/r/rouhim/arma-reforger-server/tags"><img src="https://img.shields.io/badge/ARCH-amd64-blueviolet" alt="os-arch"></a>
    <a href="https://buymeacoffee.com/rouhim"><img alt="Donate me" src="https://img.shields.io/badge/-buy_me_a%C2%A0coffee-gray?logo=buy-me-a-coffee"></a>
</p>

<p align="center">
    This repository provides a <a href="https://github.com/RouHim/arma-reforger-container-image/actions/workflows/scheduled-security-audit.yaml">safe</a> container image for the <a href="https://reforger.armaplatform.com">Arma Reforger</a> game server. 
  It is designed to be used with Docker Compose, making it easy to set up and manage your game server environment.
</p>

## Requirements

* [Docker](https://docs.docker.com/engine/install/)
* [Docker Compose](https://docs.docker.com/compose/install/standalone/)
* 6GB RAM
* 4 Core CPU

## Quick Start

```bash
git clone https://github.com/RouHim/arma-reforger-container-image.git
cd arma-reforger-container-image
mkdir -p config/ data/ profiles/ mods/
chmod -R 777 config/ data/ mods/ profiles/
cp example.config.json config/config.json # Adjust the config file as needed
docker compose pull
docker compose up -d
```

## Installation

Once _Docker_ and _Docker Compose_ are installed, clone this repository to your local machine:

```bash
git clone https://github.com/RouHim/arma-reforger-container-image.git
cd arma-reforger-container-image
```

Before starting the server, create the required folder structure, and adjust the permissions:

```bash
mkdir -p config/ data/ mods/ profiles/
chmod -R 777 config/ data/ mods/ profiles/
```

> The `chmod` command is recommended to avoid permission issues.
> The main reason is, that the user in the container, most likely differs from the user on the host.

The folders are listed above, and their purpose is as follows:

* `config`: Contains the server configuration files.
* `data`: Contains the game server data which is downloaded from Steam.
* `mods`: Contains the downloaded mods for the game server.
* `profiles`: Contains the server profiles.

## Configuration

The server is configured using a json file, located in the config folder and by using environment variables.

## Config File

The default configuration file to be used is called `config/config.json`.
An example configuration file is provided in the repository.

So the first thing you need to do is to copy the example configuration file to `config/config.json`:

```bash
cp example.config.json config/config.json
```

The full documentation for the configuration values can be
found [here](https://community.bistudio.com/wiki/Arma_Reforger:Server_Config).

## Environment Variables

All environment variables are optional and can be set in the `docker-compose.yml` file.

| Environment Variable      | Description                                                                                                                                                                                   | Default Value     | Example Value |
|---------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|---------------|
| `MAX_FPS`                 | The [max server FPS](https://community.bistudio.com/wiki/Arma_Reforger:Startup_Parameters#maxFPS)                                                                                             | `60`              | `120`         |
| `ADDITIONAL_STARTUP_ARGS` | Used to pass additional startup parameters to the server. Check this [link](https://community.bistudio.com/wiki/Arma_Reforger:Startup_Parameters) for a list of available startup parameters. | `` (empty string) | `-nds 1`      |
| `FAST_BOOT`               | If set to `true`, the server will skip update and validation of the server files on every boot.                                                                                               | `false`           | `true`        |

## Usage

To start the Arma Reforger server, navigate to the cloned repository's directory and use Docker Compose:

  ```bash
  docker compose pull
  docker compose up -d
```

This will pull the latest image and start the server in detached mode.

When starting the server for the first time:

* The server will download the latest version of the game from Steam to the `data/` folder.
* All mods configured in the `config/config.json` file will be downloaded to the `mods/` folder.

To restart the server after making changes to the configuration, use the following command:

```bash
docker compose restart
```

To check the server logs, use the following command:

```bash
docker compose logs -f
```

## Update

To update the server, just restart the container.
The server checks for updates and validates on every boot per default.

> To skip update and validation of the server files on every boot,
> set the `FAST_BOOT` env variable to `true`.

# Resources

- SteamDB: https://steamdb.info/app/1874900/
- Config File: https://community.bistudio.com/wiki/Arma_Reforger:Server_Config
- Guide: https://community.bistudio.com/wiki/Arma_Reforger:Server_Hosting
- Startup Parameter: https://community.bistudio.com/wiki/Arma_Reforger:Startup_Parameters
- Built from: https://github.com/RouHim/arma-reforger-container-image
- Built to: https://hub.docker.com/r/rouhim/arma-reforger-server