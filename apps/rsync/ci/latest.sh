#!/usr/bin/env bash
version=$(grep rsync apps/rsync/Dockerfile | head -n 1 | awk -F '=' '{print $2}')
printf "%s" "${version}"
