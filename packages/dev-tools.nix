{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Version control & dotfiles
    chezmoi
    gh
    ghq

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

    # Secrets & environment
    bitwarden-cli
    dotenvx

    # Container & cluster security
    kubescape
    copacetic

    # Databases
    dblab
    rainfrog

    # Networking & hosts
    hostctl

    # Build & shell tooling
    bunster
    powershell     # pinned to 7.6.5 by overlays/powershell.nix
    pwsh-unstable  # preview build, same overlay

    # Misc developer tools
    aube  # jdx's Node.js package manager
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
