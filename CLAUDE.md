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
task apply           # home-manager switch (alias: task switch)
task update          # nix flake update
task smas            # Switch to master and pull
task clean           # Remove build results
```

`pab`, `morning-routine` and `deleb` are the repo owner's own manual tools.
Agents must not use them — see the branch rule below.

## Architecture

- **`flake.nix`** — Flake inputs (nixpkgs unstable + home-manager) and output defining the `mimikun` homeConfiguration. `pkgs` is built with `import nixpkgs` rather than `legacyPackages`, so that overlays apply.
- **`overlays/`** — One overlay per file, listed in `overlays/default.nix`. Each file records why it exists and the condition under which it should be deleted. Reach for an overlay only when nixpkgs cannot express the need; a version pin is the usual case.
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
- `patch-YYYYMMDD` branches belong to the repo owner's own manual workflow (`task pab`, `task morning-routine`). **Agents must not create, reuse, or delete them**, and must not run those tasks.
- Agents name branches after the Conventional Commits type of the work: `feat/<topic>`, `fix/<topic>`, `docs/<topic>`, `chore/<topic>`, `refactor/<topic>`. Branch off an up-to-date `master`.
- Only ever applied on the `Azusa` machine. `Wakamo` and `Izuna` are untested, not known-broken -- nothing here is host-specific, so don't add host handling on the assumption that they fail. If one of them is the target, build it first (`nix build --no-link .#homeConfigurations.mimikun.activationPackage`) and report what breaks.

## Commit Standards

When Claude Code performs work that results in a commit, the commit message
**must** carry a Co-Author trailer naming the model that did the work:

```
Co-Authored-By: Claude <model name> <noreply@anthropic.com>
```

Write the name of the model actually in use. A fixed table of models is
deliberately not kept here -- it goes stale on every release, and a stale table
is worse than no table because it reads as authoritative.

Example:

```bash
git commit -m "$(cat <<'EOF'
feat(packages): add ripgrep to cli tools

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
EOF
)"
```

