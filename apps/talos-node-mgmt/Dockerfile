FROM docker.io/library/alpine:latest
ARG VERSION
ENV TALOS_VERSION=v1.10.0-alpha.2
ENV KUBERNETES_VERSION=v1.32.3
ADD "https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/talosctl-linux-amd64" "/bin/talosctl"
ADD "https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" "/bin/kubectl"
RUN \
    wget https://github.com/google/go-containerregistry/releases/download/v0.19.1/go-containerregistry_Linux_x86_64.tar.gz -q -O /tmp/crane.tar.gz \
    && \
    tar xf /tmp/crane.tar.gz --directory /usr/bin
RUN apk add --no-cache \
    bash \
    ca-certificates \
    jq
RUN rm -rf /tmp/*
COPY ./apps/talos-node-mgmt/entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/talosctl && \
    chmod +x /bin/kubectl && \
    chmod +x /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]
