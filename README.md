# Vault Test Setup

Goal of this Setup is to test configuration for an productive instance.

## Documentation

- [Docker Hub](https://hub.docker.com/r/hashicorp/vault)
- [Hashicorp Documentation](https://www.vaultproject.io/)
- [GitHub](https://github.com/hashicorp/vault)

## Configuration

### Vault Server

#### Relevant Notes from Docker Hub

- to use the image in a productive way the `server` command shall be called followed by the arguments provided to the vault server executable
- `/vault/logs`, to use for writing persistent audit logs. By default nothing is written here; the `file` audit backend must be enabled with a path under this directory.
- `/vault/file`, to use for writing persistent storage data when using the file data storage plugin. By default nothing is written here (a dev server uses an in-memory data store); the `file` data storage backend must be enabled in Vault's configuration before the container is started.

#### Gitlab Setup

Enable JWT.

``` powershell
vault auth enable jwt
```

Configure JWT

``` powershell
vault write auth/jwt/config jwks_url="https://grumpel.fritz.box:8443/-/jwks" bound_issuer="https://grumpel.fritz.box:8443" jwks_ca_pem=@certs\gitlab-cert.pem
```

- [vault secret details](https://docs.gitlab.com/ee/ci/yaml/#secrets)

### Vault Client

- [environment variables](https://developer.hashicorp.com/vault/docs/commands#environment-variables)
- [unlock via client](https://developer.hashicorp.com/vault/docs/commands/operator/unseal)

### GitLab Server

Note: `The external_url` also reconfigures the nginx port if not overridden. You should be especially aware of this if you try to remap default ports with ports to your convenience and provide the external port in `external_url`.

## Image Source

Download the image from Docker Hub.

``` sh
docker pull hashicorp/vault
```

## Run

### Docker Compose

``` powershell
  docker-compose -f <file> up
```

### GitLab Runner via local Docker

This is my first and currently discarded attempt.

``` powershell
docker run --name gitlab-runner --rm -e "CA_CERTIFICATES_PATH=/certs/ca-cert.pem" -v .\certs\ca-cert.pem:/certs/ca-cert.pem:ro  -v .\gitlab-runner-home:/home/gitlab-runner -v .\gitlab-runner-config:/etc/gitlab-runner gitlab/gitlab-runner:latest
```

Latest attempt is to run an Ubuntu VM providing Docker.
