#!/usr/bin/env bash
version=$(cat apps/wyoming-whisper/Dockerfile | awk -F ':' '{print $2}' | awk -F '@' '{print $1}')
printf "%s" "${version}"
