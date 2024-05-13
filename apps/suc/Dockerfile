ARG VERSION
FROM --platform=amd64 ghcr.io/actions/actions-runner:latest
ENV TALOS_VERSION="v1.6.6"
ENV KUBERNETES_VERSION="v1.26.13"

FROM docker.io/library/alpine:latest
ADD https://github.com/siderolabs/talos/releases/download/${TALOS_VERSION}/talosctl-linux-amd64 /bin/talosctl
ADD https://dl.k8s.io/release/${KUBERNETES_VERSION}/bin/linux/amd64/kubectl /bin/kubectl
COPY ./entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/talosctl && \
    chmod +x /bin/kubectl && \
    chmod +x /bin/entrypoint.sh
CMD ["/bin/entrypoint.sh"]
