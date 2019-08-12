ARG ARCH="amd64"
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:latest

ARG ARCH="amd64"
ARG OS="linux"
COPY .build/${OS}-${ARCH}/vault_exporter   /bin/vault_exporter

EXPOSE     9410
ENTRYPOINT [ "/bin/vault_exporter" ]
