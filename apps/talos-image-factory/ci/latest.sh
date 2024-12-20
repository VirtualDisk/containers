#!/usr/bin/env bash
version=$(grep factory apps/talos-image-factory/Dockerfile | head -n 1 | awk -F ':' '{print $2}' | cut -d '@' -f 1)
printf "%s" "${version}"
