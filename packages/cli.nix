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
    yazi  # covers the yazi-cli and yazi-fm crates

    # File and directory tools, moved off `cargo install` on 2026-08-22. Same
    # rule as the earlier batches: nixpkgs src owner/repo checked against what
    # crates.io lists, binary names read from meta.mainProgram, and every
    # version matched what cargo had installed.
    eza         # ls replacement
    lsd         # ls replacement
    natls       # ls replacement
    tre-command # tree, improved; installs as `tre`
    erdtree     # tree plus disk usage; installs as `erd`
    dutree      # file system usage
    dysk        # mounted disk information
    diskwatch   # disk diagnostics TUI
    redu        # ncdu for a restic repository
    fclones     # duplicate file finder
    fselect     # find files with SQL-like queries
    nomino      # batch rename
    rip2        # safer rm; installs as `rip`. Repo renamed rip -> rip2, a 301
                # confirms it, so crates.io still names the old path
    trashy      # rm and trash-cli alternative; installs as `trash`
    stu         # file explorer for S3 buckets

    # Search & navigation
    zf
    broot       # tree view with fuzzy search
    tere        # faster cd + ls
    zoxide      # cd that learns

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

    # Typing practice. Moved off cargo on 2026-08-20: building it took 7h51m of
    # a 10h vup run, 78% of the total, and was killed rather than finished.
    gittype

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
