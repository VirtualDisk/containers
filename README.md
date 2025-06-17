<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/README.md.j2
-->
<div align="center">


## Containers de la Casa de Blanco

_A collection of container images used in the infrastructure for CdB_

</div>

<div align="center">

![GitHub Repo stars](https://img.shields.io/github/stars/VirtualDisk/containers?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/VirtualDisk/containers?style=for-the-badge)
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/VirtualDisk/containers/release-scheduled.yaml?style=for-the-badge&label=Scheduled%20Release)

</div>

Welcome to my container images, if looking for a container start by [browsing the GitHub Packages page for this repo's packages](https://github.com/virtualdisk?tab=packages&repo_name=containers).

## Purpose

Sometimes an upstream container does not have certain configurations or binaries I need to use within my home infrastructure. This repository provides a way for me to automatically build and update my own containers based off of upstream images.
These containers are subject to change at any time, but you are free to use them.

## Available Images

Each Image will be built with a `rolling` tag, along with tags specific to it's version. Available Images Below

Container | Channel | Image
--- | --- | ---
[actions-runner](https://github.com/VirtualDisk/containers/pkgs/container/actions-runner) | stable | ghcr.io/VirtualDisk/actions-runner
[argocd](https://github.com/VirtualDisk/containers/pkgs/container/argocd) | stable | ghcr.io/VirtualDisk/argocd
[docker](https://github.com/VirtualDisk/containers/pkgs/container/docker) | stable | ghcr.io/VirtualDisk/docker
[git](https://github.com/VirtualDisk/containers/pkgs/container/git) | stable | ghcr.io/VirtualDisk/git
[ha-sip](https://github.com/VirtualDisk/containers/pkgs/container/ha-sip) | stable | ghcr.io/VirtualDisk/ha-sip
[home-assistant](https://github.com/VirtualDisk/containers/pkgs/container/home-assistant) | stable | ghcr.io/VirtualDisk/home-assistant
[olivetin](https://github.com/VirtualDisk/containers/pkgs/container/olivetin) | stable | ghcr.io/VirtualDisk/olivetin
[owncast](https://github.com/VirtualDisk/containers/pkgs/container/owncast) | stable | ghcr.io/VirtualDisk/owncast
[rsync](https://github.com/VirtualDisk/containers/pkgs/container/rsync) | stable | ghcr.io/VirtualDisk/rsync
[talos-node-mgmt](https://github.com/VirtualDisk/containers/pkgs/container/talos-node-mgmt) | stable | ghcr.io/VirtualDisk/talos-node-mgmt
[wget](https://github.com/VirtualDisk/containers/pkgs/container/wget) | stable | ghcr.io/VirtualDisk/wget
[wyoming-openwakeword](https://github.com/VirtualDisk/containers/pkgs/container/wyoming-openwakeword) | stable | ghcr.io/VirtualDisk/wyoming-openwakeword
[wyoming-piper](https://github.com/VirtualDisk/containers/pkgs/container/wyoming-piper) | stable | ghcr.io/VirtualDisk/wyoming-piper
[wyoming-whisper](https://github.com/VirtualDisk/containers/pkgs/container/wyoming-whisper) | stable | ghcr.io/VirtualDisk/wyoming-whisper


## Deprecations

The availability of these containers are subject to change at *ANY POINT* without warning. For a project better intended for public consumption, check out [onedr0p's containers project](https://github.com/onedr0p/containers), which is what this repo is based on.

## Credits

A lot of inspiration and ideas are thanks to the hard work of [linuxserver.io](https://www.linuxserver.io/) contributors and [onedr0p](https://github.com/onedr0p).