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

    # Networking & hosts
    hostctl

    # Build & shell tooling
    bunster

    # Misc developer tools
    horcrux
    twitch-cli
  ];
}
