#!/bin/bash

set -euo pipefail

log()      { printf "\033[1;32m[INFO]\033[0m %s\n" "$*"; }
warn()     { printf "\033[1;33m[WARN]\033[0m %s\n" "$*"; }
error()    { printf "\033[1;31m[ERR]\033[0m  %s\n" "$*" >&2; exit 1; }

require_root() {
    [[ "$EUID" -eq 0 ]] || error "This step must be run as root."
}

make_copy() {
    local target="$1"
    [[ -e "$target" ]] || return
    cp -a "$target" "${target}.bak.$(date +%s)"
}

