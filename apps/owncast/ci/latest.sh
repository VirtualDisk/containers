#!/usr/bin/env bash
version=$(cat apps/owncast/Dockerfile | awk -F ':' '{print $2}' | awk -F '@' '{print $1}')
printf "%s" "${version}"
