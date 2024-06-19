#!/usr/bin/env bash
version=$(curl -sX GET "https://gitea.com/gitea/act_runner/releases/latest" | awk -F / '{print $6}' | awk -F \" '{print $1}')
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
