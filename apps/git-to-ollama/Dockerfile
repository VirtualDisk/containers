FROM docker.io/library/alpine:3.21.2
RUN apk add --no-cache \
    "curl=8.11.1-r0" \
    "jq=1.7.1-r0" \
    "git" \
    "bash"
COPY apps/git-to-ollama/entrypoint.sh /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
