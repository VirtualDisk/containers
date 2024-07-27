#!/usr/bin/env bash
version=$(grep wget apps/wget/Dockerfile | head -n 1 | awk -F '=' '{print $2}')
printf "%s" "${version}"
