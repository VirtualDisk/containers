#!/usr/bin/env sh

talosctl --nodes=$NODE_IP reset --reboot="${REBOOT:-true}" --wait=false &&
    kubectl delete node $NODE --wait=false
