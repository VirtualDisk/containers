FROM docker.io/library/debian:latest AS downloader
RUN apt update && apt install -y curl
ADD https://github.com/cloudnative-pg/cloudnative-pg/releases/download/v1.21.1/kubectl-cnpg_1.21.1_linux_x86_64.tar.gz /tmp
ADD "https://dl.k8s.io/release/v1.32.2/bin/linux/amd64/kubectl" /tmp/kubectl
ADD "https://github.com/siderolabs/talos/releases/download/v1.9.3/talosctl-linux-amd64" /tmp/talosctl
RUN cd /tmp && tar xf /tmp/kubectl-cnpg_1.21.1_linux_x86_64.tar.gz && \
    chmod +x  /tmp/kubectl-cnpg && \
    chmod +x  /tmp/kubectl && \
    chmod +x  /tmp/talosctl

FROM lscr.io/linuxserver/homeassistant:2025.3.2@sha256:3d1adc545e738c5fd258bec4008ab4bfb14ed48ec7c1b440cc70de7b2726a0c2

COPY --from=downloader /tmp/kubectl-cnpg /extbin/kubectl-cnpg
COPY --from=downloader /tmp/kubectl /extbin/kubectl
COPY --from=downloader /tmp/talosctl /extbin/talosctl
