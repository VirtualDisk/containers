#!/usr/bin/env bash
SHA=$(git ls-remote https://github.com/frcooper/ollama-exporter | head -1 | sed "s/HEAD//" | cut -c1-8)
printf "%s-%s" "main" "${SHA}"
