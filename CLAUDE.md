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
- **`home.nix`** — Top-level module that imports all category-specific modules. Should contain only `imports`, `home.username`, `home.homeDirectory`, `home.stateVersion`, and `programs.home-manager.enable`.
- **`packages/default.nix`** — Imports all files under `packages/`.
- **`packages/*.nix`** — `home.packages` split by category (e.g. `cli.nix`, `dev-tools.nix`, `file-tools.nix`).
- **`files.nix`** — `home.file` dotfile symlink definitions.
- **`env.nix`** — `home.sessionVariables` environment variables.
- **`programs.nix`** — `programs.*` configuration options.
- **`flake.lock`** — Pinned input revisions; update with `nix flake update`.

When adding new packages, place them in the appropriate file under `packages/`. When adding other settings, use the corresponding top-level file rather than `home.nix` directly.

## Important Constraints

- **`home.stateVersion = "24.05"` must never be changed** — this controls migration behavior and changing it can break the activation.
- The branch workflow uses short-lived `patch-YYYYMMDD` branches off `master`; use `task pab` to create one before making changes.
- Currently only works on the `Azusa` machine; `Wakamo` (NixOS/ArchLinux) and `Izuna` hosts are not yet functional.

## Commit Standards

When Claude Code performs work that results in a commit, the commit message **must** include a Co-Author trailer identifying the model used:

| Model | Trailer |
|---|---|
| Claude Opus 4.6 | `Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>` |
| Claude Sonnet 4.6 | `Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>` |
| Claude Haiku 4.5 | `Co-Authored-By: Claude Haiku 4.5 <noreply@anthropic.com>` |

Use the trailer that matches the model currently in use. Example:

```bash
git commit -m "$(cat <<'EOF'
feat(packages): add ripgrep to cli tools

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
EOF
)"
```

