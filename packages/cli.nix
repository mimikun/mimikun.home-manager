{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # System monitoring
    btop
    ctop
    duf
    gdu
    fastfetch

    # General CLI utilities
    jq
    direnv
    mods

    # Files & disk
    gomi
    ncdu
    superfile

    # Search & navigation
    zf

    # Log viewing
    lnav
    hl-log-viewer  # pamburus/hl

    # Terminal & process
    mprocs
    sampler
    ttyd

    # Network
    doggo

    # Data conversion
    yj

    # Task tracking
    dstask

    # Dependency checks
    has

    # Migrated from pnpm global (2026-08-20)
    npkill         # npm: npkill
    inshellisense  # npm: @microsoft/inshellisense
    moji           # npm: @microck/moji
    witr           # npm: @pranshuparmar/witr
    ghgrab         # npm: @ghgrab/ghgrab
    ccusage        # npm: ccusage
    codebuff       # npm: codebuff

    # From overlays/prebuilt-github-tools.nix
    jfryy-qq       # jq-style querying, installs as qq
    sheepla-pingu  # ping with a penguin, installs as pingu
    misskey-cli
    chmod-cli
  ];
}
