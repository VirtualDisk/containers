FROM docker.io/library/debian:trixie-slim AS downloader
RUN apt update && apt install -y curl
ENV CNPG_VERSION=1.25.1
ENV KUBERNETES_VERSION=v1.33.1
ENV TALOS_VERSION=v1.10.2
ADD "https://github.com/cloudnative-pg/cloudnative-pg/releases/download/v${CNPG_VERSION}/kubectl-cnpg_${CNPG_VERSION}_linux_x86_64.tar.gz" /tmp
ADD "https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" /tmp/kubectl
ADD "https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/talosctl-linux-amd64" /tmp/talosctl
RUN cd /tmp && tar xf "/tmp/kubectl-cnpg_${CNPG_VERSION}_linux_x86_64.tar.gz" && \
    chmod +x  /tmp/kubectl-cnpg && \
    chmod +x  /tmp/kubectl && \
    chmod +x  /tmp/talosctl

FROM lscr.io/linuxserver/homeassistant:2025.5.1@sha256:ee0e73d6a548452a755486b18b47cd4003345024c9ced05d89d26df9359ab8ad

COPY --from=downloader /tmp/kubectl-cnpg /extbin/kubectl-cnpg
COPY --from=downloader /tmp/kubectl /extbin/kubectl
COPY --from=downloader /tmp/talosctl /extbin/talosctl
