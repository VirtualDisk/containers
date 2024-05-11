#!/usr/bin/env bash
version=$(curl "https://stable.release.flatcar-linux.net/amd64-usr/current/version.txt" | grep FLATCAR_VERSION= | sed 's/FLATCAR_VERSION=//g')
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
