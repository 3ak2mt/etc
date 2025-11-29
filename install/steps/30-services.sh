#!/bin/bash
. functions.sh
require_root

log "Enabling system services…"

SERVICE_LIST="systemd/services.list"

[[ -f "$SERVICE_LIST" ]] || {
    warn "No services.list found; skipping."
    exit 0
}

while IFS= read -r svc; do
    [[ -z "$svc" ]] && continue
    systemctl enable "$svc"
done < "$SERVICE_LIST"

log "Service activation complete."
