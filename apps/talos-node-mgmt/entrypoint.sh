#!/usr/bin/env bash
set -uo pipefail
set -x

health() {
    # until echo "$(kubectl get volumes.longhorn.io -A)" | grep -q "degraded"; do
    #     echo "Some Longhorn volumes are degraded. Trying again in ${RETRY_TIME:-5} seconds."
    #     sleep "${RETRY_TIME:-5}"
    # done

    talosctl --nodes=$NODE_IP health
}

reset() {
    talosctl --nodes=$NODE_IP reset --reboot="${REBOOT:-true}" --wait=false &&
        kubectl delete node $NODE --wait=false
}

reboot() {
    kubectl label node $NODE suc.rancher.io/talos-reboot=false --overwrite=true
    talosctl --nodes=$NODE_IP reboot --wait=false
}

shutdown_all() {
    # echo kubectl annotate -n datastores clusters.postgresql.cnpg.io "${CNPG_CLUSTER:-postgresql-v27}" --overwrite cnpg.io/hibernation=on
    # until kubectl get pods -n datastores | grep -m 1 "${CNPG_CLUSTER:-postgresql-v27}"; do
    #     echo "Some "${CNPG_CLUSTER:-postgresql-v27}" pods are still up. Trying again in ${RETRY_TIME:-5} seconds."
    #     sleep "${RETRY_TIME:-5}"
    # done

    talosctl shutdown --wait=false --timeout=8m
}

check_longhorn_volumes() {
    for i in {1..20}; do
        unhealthy="$(kubectl get volumes.longhorn.io -A -o json | jq '[.items[] | select(.status.robustness != "healthy")] | length')"
        if [[ "$unhealthy" == "0" ]]; then
            echo "All Longhorn volumes are healthy."
            exit 0
        fi
        echo "Waiting for $unhealthy unhealthy Longhorn volume(s)..."
        sleep 15
    done
    echo "Some Longhorn volumes are still not healthy after waiting." >&2
    exit 1
}

"$@"
