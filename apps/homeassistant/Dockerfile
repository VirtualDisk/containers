FROM docker.io/library/debian:trixie-slim AS downloader
RUN apt-get update && apt-get install -y curl

# renovate: datasource=github-releases depName=cloudnative-pg/cloudnative-pg
ENV CNPG_VERSION=1.26.0

# renovate: datasource=github-releases depName=siderolabs/talos
ENV TALOS_VERSION=v1.10.5

# renovate: datasource=docker depName=ghcr.io/siderolabs/kubelet
ENV KUBERNETES_VERSION=v1.33.3

ADD "https://github.com/cloudnative-pg/cloudnative-pg/releases/download/v${CNPG_VERSION}/kubectl-cnpg_${CNPG_VERSION}_linux_x86_64.tar.gz" /tmp
ADD "https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" /tmp/kubectl
ADD "https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/talosctl-linux-amd64" /tmp/talosctl
RUN cd /tmp && tar xf "/tmp/kubectl-cnpg_${CNPG_VERSION}_linux_x86_64.tar.gz" && \
    chmod +x  /tmp/kubectl-cnpg && \
    chmod +x  /tmp/kubectl && \
    chmod +x  /tmp/talosctl

FROM lscr.io/linuxserver/homeassistant:2025.7.3@sha256:e04de5ec4a640df20e87dff715855ea1e381b388428d4d61578db521040a363c

COPY --from=downloader /tmp/kubectl-cnpg /extbin/kubectl-cnpg
COPY --from=downloader /tmp/kubectl /extbin/kubectl
COPY --from=downloader /tmp/talosctl /extbin/talosctl
