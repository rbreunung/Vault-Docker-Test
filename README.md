# Vault Test Setup

Goal of this Setup is to test configuration for an productive instance.

## Documentation

- [Docker Hub](https://hub.docker.com/r/hashicorp/vault)
- [Hashicorp Documentation](https://www.vaultproject.io/)
- [GitHub](https://github.com/hashicorp/vault)

## Configuration

### Relevant Notes from Docker Hub

- to use the image in a productive way the `server` command shall be called followed by the arguments provided to the vault server executable
- `/vault/logs`, to use for writing persistent audit logs. By default nothing is written here; the `file` audit backend must be enabled with a path under this directory.
- `/vault/file`, to use for writing persistent storage data when using thefile data storage plugin. By default nothing is written here (a dev server uses an in-memory data store); the `file` data storage backend must be enabled in Vault's configuration before the container is started.

### Vault Client

- [environment variables](https://developer.hashicorp.com/vault/docs/commands#environment-variables)
- [unlock via client](https://developer.hashicorp.com/vault/docs/commands/operator/unseal)

## Image Source

Download the image from Docker Hub.

``` sh
docker pull hashicorp/vault
```

## Run

``` sh
  docker-compose -f <file> up
```
