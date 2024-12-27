FROM docker.io/library/debian:latest AS builder
RUN apt update && apt install -y curl
ADD https://github.com/cloudnative-pg/cloudnative-pg/releases/download/v1.21.1/kubectl-cnpg_1.21.1_linux_x86_64.tar.gz /tmp
RUN cd /tmp && tar xf /tmp/kubectl-cnpg_1.21.1_linux_x86_64.tar.gz && \
    chmod +x  /tmp/kubectl-cnpg

FROM docker.io/jamesread/olivetin:2024.12.11

ADD "https://dl.k8s.io/release/v1.30.3/bin/linux/amd64/kubectl" /usr/bin/kubectl
COPY --from=builder /tmp/kubectl-cnpg /usr/bin/kubectl-cnpg
ADD "https://github.com/siderolabs/talos/releases/download/v1.9.1/talosctl-linux-amd64" /usr/bin/talosctl
ADD "https://github.com/sabhiram/go-wol/releases/download/v2.0.1/wol_linux_amd64" /usr/bin/wol

USER root

RUN chmod +x /usr/bin/kubectl
RUN chmod +x /usr/bin/kubectl-cnpg
RUN chmod +x /usr/bin/talosctl
RUN chmod +x /usr/bin/wol

USER olivetin
