#!/usr/bin/env bash
version=$(grep curl apps/curl/Dockerfile | head -n 1 | awk -F '=' '{print $2}' | awk -F '\"' '{print $1}')
printf "%s" "${version}"
