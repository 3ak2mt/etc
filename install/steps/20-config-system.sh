#!/bin/bash
. functions.sh
require_root

log "Applying system configuration…"

copy_dir() {
    local src="$1"
    local dest="$2"

    if [[ -d "$src" ]]; then
        mkdir -p "$dest"
        cp -r "$src"/* "$dest"/
    fi
}

copy_file() {
    local src="$1"
    local dest="$2"

    if [[ -f "$src" ]]; then
        cp "$src" "$dest"
    fi
}

# ---- directories ----
copy_dir X11        /etc/X11
copy_dir iwd        /etc/iwd
#copy_dir skel       /etc/skel
copy_dir default    /etc/default
copy_dir pacman.d   /etc/pacman.d
copy_dir systemd    /etc/systemd/system

# ---- files ----
copy_file hostname       /etc/
copy_file locale.conf    /etc/
copy_file locale.gen     /etc/
copy_file vconsole.conf  /etc/
