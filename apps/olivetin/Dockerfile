FROM docker.io/library/debian:latest AS builder
ENV TALOS_VERSION=v1.10.2
ENV ARGOCD_VERSION=v1.14.11
ENV KUBECTL_AI_VERSION=v0.0.9
ENV WOL_VERSION=v2.0.1
ENV KUBERNETES_VERSION=v1.33.1
RUN apt update && apt install -y curl
ADD https://github.com/cloudnative-pg/cloudnative-pg/releases/download/v1.21.1/kubectl-cnpg_1.21.1_linux_x86_64.tar.gz /tmp
RUN cd /tmp && tar xf /tmp/kubectl-cnpg_1.21.1_linux_x86_64.tar.gz && \
    chmod +x  /tmp/kubectl-cnpg

FROM docker.io/jamesread/olivetin:2025.4.22

ADD "https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" /usr/bin/kubectl
COPY --from=builder /tmp/kubectl-cnpg /usr/bin/kubectl-cnpg
ADD "https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/talosctl-linux-amd64" /usr/bin/talosctl
ADD "https://github.com/sabhiram/go-wol/releases/download/${WOL_VERSION}/wol_linux_amd64" /usr/bin/wol
ADD https://github.com/argoproj/argo-cd/releases/download/${ARGOCD_VERSION}/argocd-linux-amd64 /usr/bin/argo
ADD https://github.com/GoogleCloudPlatform/kubectl-ai/releases/download/${KUBECTL_AI_VERSION}/kubectl-ai_Linux_x86_64.tar.gz /usr/bin/kubectl-ai

USER root

RUN chmod +x /usr/bin/kubectl
RUN chmod +x /usr/bin/kubectl-cnpg
RUN chmod +x /usr/bin/kubectl-ai
RUN chmod +x /usr/bin/talosctl
RUN chmod +x /usr/bin/wol
RUN chmod +x /usr/bin/argo

USER olivetin
