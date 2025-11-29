#!/bin/bash
. functions.sh

require_root

log "Checking system prerequisites…"

command -v pacman >/dev/null || error "pacman not found."
command -v systemctl >/dev/null || warn "systemd not found? This is unusual on Arch."

