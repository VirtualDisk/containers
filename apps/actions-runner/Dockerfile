ARG VERSION
FROM --platform=amd64 ghcr.io/actions/actions-runner:latest

# renovate: datasource=docker depName=ghcr.io/siderolabs/kubelet
ENV KUBERNETES_VERSION=v1.33.2
# renovate: datasource=github-releases depName=siderolabs/talos
ENV TALOS_VERSION=v1.10.5
# renovate: datasource=github-releases depName=argoproj/argo-cd
ENV ARGOCD_VERSION=v3.0.11
# renovate: datasource=github-releases depName=google/go-containerregistry
ENV CRANE_VERSION=v0.20.6
# renovate: datasource=github-releases depName=mikefarah/yq
ENV YQ_VERSION=v4.45.4
# renovate: datasource=github-releases depName=jqlang/jq
ENV JQ_VERSION=jq-1.7.1

ENV HOMEBREW_NO_ANALYTICS=1 \
    HOMEBREW_NO_ENV_HINTS=1 \
    HOMEBREW_NO_INSTALL_CLEANUP=1 \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND="noninteractive" \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

USER root

RUN \
    apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    ca-certificates \
    buildah \
    curl \
    gcc \
    git \
    jo \
    jq \
    moreutils \
    unrar \
    unzip \
    wakeonlan \
    wget \
    zip \
    && \
    rm -rf /var/lib/apt/lists/*

RUN \
    wget https://github.com/google/go-containerregistry/releases/download/${CRANE_VERSION}/go-containerregistry_Linux_x86_64.tar.gz -q -O /tmp/crane.tar.gz \
    && \
    tar xf /tmp/crane.tar.gz --directory /usr/bin

RUN \
    wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -q -O /usr/bin/yq \
    && \
    chmod +x /usr/bin/yq

RUN \
    wget https://github.com/jqlang/jq/releases/download/${JQ_VERSION}/jq-linux-amd64 -q -O /usr/bin/jq \
    && \
    chmod +x /usr/bin/jq

RUN \
    wget https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip -q -O /tmp/terraform.zip \
    && \
    unzip /tmp/terraform.zip -d /usr/bin/

RUN \
    wget https://github.com/argoproj/argo-cd/releases/download/${ARGOCD_VERSION}/argocd-linux-amd64 -q -O /usr/bin/argocd \
    && \
    chmod +x /usr/bin/argocd

RUN \
    wget https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl -q -O /usr/bin/kubectl \
    && \
    chmod +x /usr/bin/kubectl

ADD "https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/talosctl-linux-amd64" \
    "/usr/bin/talosctl"
RUN chmod +x /usr/bin/talosctl

RUN \
    wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.4.3/kustomize_v5.4.3_linux_amd64.tar.gz -q -O /tmp/kustomize.tar.gz \
    && \
    tar xf /tmp/kustomize.tar.gz --directory /usr/bin

RUN \
    wget https://github.com/viaduct-ai/kustomize-sops/releases/download/v4.3.2/ksops_4.3.2_Linux_x86_64.tar.gz -q -O /tmp/ksops.tar.gz \
    && \
    tar xf /tmp/ksops.tar.gz --directory /usr/bin

USER runner

RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
