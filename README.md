# Vault Exporter

[![CircleCI](https://circleci.com/gh/Damoun/vault_exporter/tree/master.svg?style=shield)][circleci]
[![Docker Pulls](https://img.shields.io/docker/pulls/damoun/vault-exporter.svg?maxAge=604800)][hub]

Export [Hashicorp Vault](https://github.com/hashicorp/vault) health to [Prometheus](https://github.com/prometheus/prometheus).

To run it:

```bash
make
./vault_exporter [flags]
```

## Exported Metrics

| Metric | Meaning | Labels |
| ------ | ------- | ------ |
| vault_up | Was the last query of Vault successful, | |
| vault_initialized | Is the Vault initialised (according to this node). | |
| vault_sealed | Is the Vault node sealed. | |
| vault_standby | Is this Vault node in standby. | |
| vault_replication_dr_primary | Is this Vault node a primary disaster recovery replica. | |
| vault_replication_dr_secondary | Is this Vault node a secondary disaster recovery replica. | |
| vault_replication_performance_primary | Is this Vault node a primary performance replica. | |
| vault_replication_performance_secondary | Is this Vault node a secondary performance replica. | |
| vault_info | Various info about the Vault node. | version, cluster_name, cluster_id |

### Flags

```bash
./vault_exporter --help
```

* __`vault-tls-cacert`:__ The path to a PEM-encoded CA cert file to use to verify the Vault server SSL certificate.
* __`vault-tls-client-cert`:__ The path to the certificate for Vault communication.
* __`vault-tls-client-key`:__ The path to the private key for Vault communication.
* __`insecure-ssl`:__ Set SSL to ignore certificate validation.
* __`log.format`:__ Set the log target and format. Example: `logger:syslog?appname=bob&local=7`
    or `logger:stdout?json=true`
* __`log.level`:__ Logging level. `info` by default.
* __`version`:__ Show application version.
* __`web.listen-address`:__ Address to listen on for web interface and telemetry.
* __`web.telemetry-path`:__ Path under which to expose metrics.

### Environment variables

The vault\_exporter supports all environment variables provided by the official
[vault/api package](https://github.com/hashicorp/vault/blob/18aaf01fbe49e865ed3f1932609110e7b5475758/api/client.go#L28-L42),
including `VAULT_TOKEN` to set the [Auth](https://www.vaultproject.io/docs/auth/token.html) token.

## Useful Queries

__Is my Vault sealed?__

    vault_sealed != 0

__Is my Vault Up?__

    vault_up != 0

## Using Docker

You can deploy this exporter using the [damoun/vault-exporter](https://hub.docker.com/r/damoun/vault-exporter/) Docker image.

For example:

```bash
docker pull damoun/vault-exporter

docker run -d -p 9410:9410 \
        --env VAULT_ADDR=http://127.0.0.1:8200 \
        damoun/vault-exporter
```

[circleci]: https://circleci.com/gh/damoun/vault_exporter
[hub]: https://hub.docker.com/r/damoun/vault-exporter/