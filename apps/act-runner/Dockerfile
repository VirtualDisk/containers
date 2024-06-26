ARG VERSION
FROM --platform=amd64 docker.io/gitea/act_runner:latest

ENV HOMEBREW_NO_ANALYTICS=1 \
    HOMEBREW_NO_ENV_HINTS=1 \
    HOMEBREW_NO_INSTALL_CLEANUP=1 \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    DEBIAN_FRONTEND="noninteractive" \
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

USER root

RUN \
    apk add --no-cache \
    ca-certificates \
    curl \
    gcc \
    git \
    jo \
    jq \
    moreutils \
    unzip \
    wget \
    ruby \
    zip

RUN \
    wget https://github.com/google/go-containerregistry/releases/download/v0.19.1/go-containerregistry_Linux_x86_64.tar.gz -q -O /tmp/crane.tar.gz \
    && \
    tar xf /tmp/crane.tar.gz --directory /usr/bin

RUN \
    wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -q -O /usr/bin/yq \
    && \
    chmod +x /usr/bin/yq

RUN \
    wget https://github.com/jqlang/jq/releases/download/jq-1.7.1/jq-linux-amd64 -q -O /usr/bin/jq \
    && \
    chmod +x /usr/bin/jq

RUN \
    wget https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip -q -O /tmp/terraform.zip \
    && \
    unzip /tmp/terraform.zip -d /usr/bin/

RUN \
    wget https://github.com/argoproj/argo-cd/releases/download/v2.11.2/argocd-linux-amd64 -q -O /usr/bin/argocd \
    && \
    chmod +x /usr/bin/argocd


RUN \
    wget https://dl.k8s.io/release/v1.26.14/bin/linux/amd64/kubectl -q -O /usr/bin/kubectl \
    && \
    chmod +x /usr/bin/kubectl
