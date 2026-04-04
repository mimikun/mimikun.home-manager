# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Standalone [Home Manager](https://github.com/nix-community/home-manager) configuration using Nix flakes for user `mimikun` on `x86_64-linux`. Tracks `nixos-unstable` nixpkgs channel.

## Common Commands

```bash
# Apply configuration changes
home-manager switch --flake .#mimikun

# Update flake inputs (nixpkgs, home-manager)
nix flake update

# Check flake outputs without applying
nix flake check

# Task runner (see all tasks)
task
```

### Taskfile Tasks

```bash
task pull            # git pull
task push            # git push origin master
task cleanfetch      # git fetch --all --prune --tags --prune-tags
task pab             # Create a patch-YYYYMMDD branch for changes
task morning-routine # fetch + delete old patch branches + pull + new patch branch
task deleb           # Delete all patch* branches
```

## Architecture

- **`flake.nix`** — Flake inputs (nixpkgs unstable + home-manager) and output defining the `mimikun` homeConfiguration.
- **`home.nix`** — The sole configuration module: packages, dotfiles, session variables, and program options.
- **`flake.lock`** — Pinned input revisions; update with `nix flake update`.

## Important Constraints

- **`home.stateVersion = "24.05"` must never be changed** — this controls migration behavior and changing it can break the activation.
- The branch workflow uses short-lived `patch-YYYYMMDD` branches off `master`; use `task pab` to create one before making changes.
- Currently only works on the `Azusa` machine; `Wakamo` (NixOS/ArchLinux) and `Izuna` hosts are not yet functional.

