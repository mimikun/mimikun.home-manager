{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Version control & dotfiles
    chezmoi
    gh
    ghq
    hk  # jdx/hk: git hook manager

    # Fuzzy finder
    fzf

    # Task runner
    go-task

    # Security scanning
    trivy
    gitleaks
    zizmor  # finds security issues in GitHub Actions workflows

    # Test runners
    cargo-nextest

    # Linting & formatting
    shellcheck
    hadolint
    go-tools  # dominikh/go-tools: staticcheck
    errcheck
    checkmake
    ls-lint
    uv
    ruff
    rumdl  # markdown linter and formatter

    # Kubernetes
    kubectx
    k9s

    # Load testing
    vegeta
    k6

    # Languages
    gleam

    # Issue & change tracking
    git-bug
    jjui
    diffnav
    tuicr  # review AI-generated diffs like a pull request

    # Secrets & environment
    bitwarden-cli
    dotenvx

    # Container & cluster security
    kubescape
    copacetic
    nono  # kernel-enforced sandbox for AI agents; the nono-cli crate

    # Databases
    dblab
    rainfrog

    # Networking & hosts
    hostctl

    # Build & shell tooling
    bunster
    powershell     # pinned to 7.6.5 by overlays/powershell.nix
    pwsh-unstable  # preview build, same overlay

    # Cargo plugins. Moved off `cargo install` on 2026-08-20; nixpkgs carries
    # them, and every src owner/repo was checked against what crates.io lists
    # for the crate. cargo-geiger is deliberately absent: nixpkgs builds it
    # from geiger-rs/cargo-geiger while crates.io points at
    # rust-secure-code/cargo-geiger, and that was not resolved.
    cargo-all-features
    cargo-audit
    cargo-cache
    cargo-deny
    cargo-edit
    cargo-fuzz
    cargo-license
    cargo-limit
    cargo-llvm-cov
    cargo-make
    cargo-msrv
    cargo-outdated
    cargo-release
    cargo-seek
    cargo-tarpaulin
    cargo-udeps
    cargo-update  # provides `cargo install-update`, which generate/package-lists.ts runs
    cargo-wipe

    # Misc developer tools
    aube         # jdx's Node.js package manager
    cargo-about  # lists the licenses of a crate's dependencies
    horcrux
    twitch-cli

    # Migrated from pnpm global (2026-08-20)
    ast-grep     # npm: @ast-grep/cli
    bats         # npm: bats
    prettier     # npm: prettier
    prek         # npm: @j178/prek
    httpyac      # npm: httpyac
    mermaid-cli  # npm: @mermaid-js/mermaid-cli, installs as mmdc
    codegraph    # npm: @colbymchenry/codegraph

    # From overlays/prebuilt-github-tools.nix
    aqua-registry-tool  # installs as argd
    reminder-lint
    cmdx
    gaze
    dagu
    godap
    pkgx
    termkit-gama        # GitHub Actions TUI, installs as gama
  ];
}
