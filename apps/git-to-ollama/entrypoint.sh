#!/usr/bin/env bash
set -eo pipefail
set -x

git clone "${GIT_REPO}" /repo
DOCUMENTS=$(find /repo)
for file in $DOCUMENTS; do
    echo "Uploading file ${file}"
    FILE_ID=$(curl -X POST \
        -H "Authorization: Bearer ${OLLAMA_API_KEY}" \
        -H "Accept: application/json" \
        -F "file=@$file" \
        "https://open-webui.verde.zoe/api/v1/files/" |
        jq -r .id)

    echo "Adding file ${file} to knowledge base ${KNOWLEDGE_BASE_ID}"
    curl -X POST \
        -H "Authorization: Bearer ${OLLAMA_API_KEY}" \
        -H "Content-Type: application/json" \
        -d '{"file_id:" "'"${FILE_ID}"'"}' \
        "https://open-webui.verde.zoe/api/v1/knowledge/${KNOWLEDGE_BASE_ID}/file/add/"
    echo "Added file ${file} to knowledge base ${KNOWLEDGE_BASE_ID}."
done
