FROM docker.io/library/alpine:latest
ARG VERSION
ENV TALOS_VERSION=v1.7.5
ENV KUBERNETES_VERSION=v1.26.14
ADD "https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/talosctl-linux-amd64" "/bin/talosctl"
ADD "https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl" "/bin/kubectl"
COPY ./apps/talos-node-mgmt/entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/talosctl && \
    chmod +x /bin/kubectl && \
    chmod +x /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]
