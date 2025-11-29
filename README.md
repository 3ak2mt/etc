```markdown
# System Configuration – Arch Linux

This repository contains a complete set of configuration files and a modular installation automation system based on **bash + make**. Its purpose is to ensure deterministic system reinstallation, maintain a consistent configuration across machines, and provide a clear, minimal, auditable setup.

---

## Goals

- Preserve full control over system configuration.
- Reproduce the environment deterministically.
- Maintain minimalism: only bash, make, and standard Arch Linux tools.
- Provide a modular structure for clarity and flexibility.
- Automate installation while keeping every step transparent and inspectable.

---

## Directory Structure

```

etc/                         # Main configuration repository
  - X11/                     # X11 configuration
  - default/                 # Default settings (if used)
  - iwd/                     # iwd network configuration
  - locale.conf              # Locale settings
  - locale.gen
  - hostname                 # Hostname definition
  - pacman.d/                # pacman configuration
  - packages.x86_64          # Package list for installation
  - skel/                    # Files to populate the user's home directory
  - systemd/                 # systemd units and overrides
  - vconsole.conf            # Console configuration
  - wallpaper.png            # Auxiliary materials
  - install/                 # Installation automation
  - bin/                     # Shared helper functions
    - functions.sh
  - steps/                   # Modular installation steps
    - 00-precheck.sh
    - 10-packages.sh
    - 20-config-system.sh
    - 30-services.sh
    - 40-config-user.sh
    - 99-post.sh
  - Makefile                 # Orchestration for all installation steps
  - bootstrap.sh             # Script intended for execution from a live environment
  - README.md

```

---

## Requirements

- Arch Linux or the official Arch live ISO.
- Internet connection during installation.
- Root privileges.
- Tools: `bash`, `make`, `pacman`, `git`.

---

## Installation Automation Overview

The installation system is modular. Each step is isolated in its own script under `install/steps/`. The Makefile orchestrates these steps and ensures a predictable flow.

### Main execution targets

- **`make all`**  
  Executes: package installation → system configuration → service setup → user configuration.

- **`make packages`**  
  Installs packages listed in `packages.x86_64`.

- **`make configure`**  
  Applies system configuration: locale, vconsole, X11, systemd units.

- **`make services`**  
  Enables system services according to `systemd/services.list`.

- **`make user`**  
  Deploys user-level configuration from the `skel` directory.

Each script includes safety mechanisms (backup, validation, error handling) and may be executed independently.

---

## Using the bootstrap script

`bootstrap.sh` is intended for execution inside an Arch live environment. Its responsibilities are:

1. Clone this repository into the target filesystem.
2. Enter the new environment via `arch-chroot`.
3. Run the full installation logic (`make all`).

This enables a hands-off installation approach while keeping the underlying logic transparent.

---

## Backups and Safety

Whenever a configuration file is replaced, the process creates time-stamped backups.  
The system uses `set -euo pipefail` across all scripts to ensure early and predictable failure on errors.

---

## Customization

You may extend this repository with:

- AUR package installation steps.
- Desktop environment or window manager modules.
- User dotfiles management.
- Optional roles (server, workstation, minimal).

The modular structure makes it straightforward to add or remove components.

---

## Purpose of the Repository

This setup is intended for users seeking a reproducible, minimal, auditable, and maintainable Arch Linux configuration. It aligns with workflows centered around terminal tools, low resource usage, and precise control over system behavior.

---
```
