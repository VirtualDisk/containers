#!/usr/bin/env sh
set -uo pipefail

health() {
    until kubectl get volumes.longhorn.io -A | grep -m 1 "degraded"; do
        echo "Some Longhorn volumes are degraded. Trying again in ${RETRY_TIME:-5} seconds."
        kubectl get volumes.longhorn.io -A | grep "degraded"
        sleep "${RETRY_TIME:-5}"
    done

    talosctl --nodes=$NODE_IP health
}

reset() {
    talosctl --nodes=$NODE_IP reset --reboot="${REBOOT:-true}" --wait=false &&
        kubectl delete node $NODE --wait=false
}

"$@"
