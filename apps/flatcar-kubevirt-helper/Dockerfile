FROM docker.io/library/alpine:3.22.1
ARG VERSION
# renovate: datasource=docker depName=ghcr.io/siderolabs/kubelet
ENV KUBERNETES_VERSION=v1.33.3
ENV BUTANE_VERSION=v0.24.0

ADD "https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" "/bin/kubectl"
ADD "https://github.com/coreos/butane/releases/download/${BUTANE_VERSION}/butane-x86_64-unknown-linux-gnu" "/bin/butane"
RUN apk add --no-cache \
    bash \
    ca-certificates \
    jq

RUN rm -rf /tmp/*
RUN chmod +x /bin/kubectl && \
    chmod +x /bin/butane
RUN chown 1000:1000 /bin/kubectl && \
    chown 1000:1000 /bin/butane

USER 1000
CMD ["bash"]
