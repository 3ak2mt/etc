#!/bin/bash
. functions.sh
require_root

log "Installing base package set…"

[[ -f packages.x86_64 ]] || error "packages.x86_64 not found."

pacman --noconfirm -Sy
pacman -S --noconfirm --needed - < packages.x86_64

log "Package installation complete."

