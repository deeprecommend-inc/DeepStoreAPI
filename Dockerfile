FROM mcr.microsoft.com/vscode/devcontainers/rust:0-1

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends postgresql-client \
     && cargo install sea-orm-cli \
     && chown -R vscode /usr/local/cargo

COPY .env /.env
