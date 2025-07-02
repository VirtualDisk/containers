FROM docker.io/library/debian:trixie-slim AS downloader
RUN apt-get update && apt-get install -y curl

# renovate: datasource=github-releases depName=cloudnative-pg/cloudnative-pg
ENV CNPG_VERSION=1.26.0

# renovate: datasource=github-releases depName=siderolabs/talos
ENV TALOS_VERSION=v1.10.4

# renovate: datasource=docker depName=ghcr.io/siderolabs/kubelet
ENV KUBERNETES_VERSION=v1.33.2

ADD "https://github.com/cloudnative-pg/cloudnative-pg/releases/download/v${CNPG_VERSION}/kubectl-cnpg_${CNPG_VERSION}_linux_x86_64.tar.gz" /tmp
ADD "https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" /tmp/kubectl
ADD "https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/talosctl-linux-amd64" /tmp/talosctl
RUN cd /tmp && tar xf "/tmp/kubectl-cnpg_${CNPG_VERSION}_linux_x86_64.tar.gz" && \
    chmod +x  /tmp/kubectl-cnpg && \
    chmod +x  /tmp/kubectl && \
    chmod +x  /tmp/talosctl

FROM lscr.io/linuxserver/homeassistant:2025.7.0@sha256:7649326166750db56a8de34874f83377a5d03af1ffb54aefd6244d616015c94c

COPY --from=downloader /tmp/kubectl-cnpg /extbin/kubectl-cnpg
COPY --from=downloader /tmp/kubectl /extbin/kubectl
COPY --from=downloader /tmp/talosctl /extbin/talosctl
