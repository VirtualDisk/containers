ARG VERSION
ARG TALOS_VERSION=v1.6.6
ARG KUBERNETES_VERSION=v1.26.13
FROM docker.io/library/alpine:latest
ADD "https://github.com/siderolabs/talos/releases/download/v1.6.6/talosctl-linux-amd64" "/bin/talosctl"
ADD "https://dl.k8s.io/release/v1.26.14/bin/linux/amd64/kubectl" "/bin/kubectl"
COPY ./apps/system-upgrade-controller/entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/talosctl && \
    chmod +x /bin/kubectl && \
    chmod +x /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]
