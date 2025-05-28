# https://github.com/argoproj/argo-cd/blob/master/Dockerfile

# Build KSOPS and Kustomize

FROM quay.io/viaductoss/ksops:v4.3.3 AS ksops-builder

# Build custom Argo image

FROM quay.io/argoproj/argocd:v3.0.4

ENV ARGOCD_USER_ID=999

# Switch to root for the ability to perform install
USER root

ARG PKG_NAME=ksops

# Override the default kustomize executable with the Go built version
COPY --from=ksops-builder /usr/local/bin/kustomize /usr/local/bin/kustomize

# Add ksops executable to path
COPY --from=ksops-builder /usr/local/bin/ksops /usr/local/bin/ksops

# Switch back to non-root user
USER $ARGOCD_USER_ID
