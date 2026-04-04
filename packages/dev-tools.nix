{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Version control & dotfiles
    chezmoi
    gh
    ghq

    # Fuzzy finder
    fzf

    # Editor
    neovim

    # Security scanning
    trivy
    gitleaks

    # Linting & formatting
    shellcheck
    hadolint
    go-tools  # includes staticcheck
    uv
    ruff

    # Kubernetes
    kubectx
    k9s

    # Load testing
    vegeta

    # Languages
    gleam
  ];
}
