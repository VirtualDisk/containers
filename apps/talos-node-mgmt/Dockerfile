FROM docker.io/library/debian:latest AS builder

# renovate: datasource=github-releases depName=cloudnative-pg/cloudnative-pg
ENV CNPG_VERSION=1.26.0

RUN apt-get update && apt-get install -y curl
ADD https://github.com/cloudnative-pg/cloudnative-pg/releases/download/v${CNPG_VERSION}/kubectl-cnpg_${CNPG_VERSION}_linux_x86_64.tar.gz /tmp

RUN cd /tmp && tar xf /tmp/kubectl-cnpg_${CNPG_VERSION}_linux_x86_64.tar.gz && \
    chmod +x  /tmp/kubectl-cnpg

FROM docker.io/library/alpine:3.22.0
ARG VERSION
# renovate: datasource=github-releases depName=siderolabs/talos
ENV TALOS_VERSION=v1.10.5
# renovate: datasource=docker depName=ghcr.io/siderolabs/kubelet
ENV KUBERNETES_VERSION=v1.33.2
# renovate: datasource=github-releases depName=GoogleCloudPlatform/kubectl-ai
ENV KUBECTL_AI_VERSION=v0.0.15

ADD "https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/talosctl-linux-amd64" "/bin/talosctl"
ADD "https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" "/bin/kubectl"
RUN \
    wget https://github.com/GoogleCloudPlatform/kubectl-ai/releases/download/${KUBECTL_AI_VERSION}/kubectl-ai_Linux_x86_64.tar.gz -q -O /tmp/kubectl-ai.tar.gz \
    && \
    tar xf /tmp/kubectl-ai.tar.gz --directory /bin
RUN \
    wget https://github.com/google/go-containerregistry/releases/download/v0.19.1/go-containerregistry_Linux_x86_64.tar.gz -q -O /tmp/crane.tar.gz \
    && \
    tar xf /tmp/crane.tar.gz --directory /bin
RUN apk add --no-cache \
    bash \
    ca-certificates \
    jq

COPY --from=builder /tmp/kubectl-cnpg /bin/kubectl-cnpg
RUN rm -rf /tmp/*
COPY ./apps/talos-node-mgmt/entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/talosctl && \
    chmod +x /bin/kubectl && \
    chmod +x /bin/crane && \
    chmod +x /bin/kubectl-ai && \
    chmod +x /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]
