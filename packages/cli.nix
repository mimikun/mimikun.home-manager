{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # System monitoring
    btop
    ctop
    duf
    gdu
    fastfetch

    # System and container monitoring, moved off `cargo install` on 2026-08-22.
    # Same rule as the earlier batches: nixpkgs src owner/repo checked against
    # what crates.io lists, binary names read from meta.mainProgram, versions
    # compared before adding anything.
    procs                # ps replacement
    macchina             # system information
    hyperfine            # command benchmarking
    cyme                 # lsusb, modernised
    amdtop               # amdgpu_top frontend
    systemctl-tui        # nixpkgs is at 0.8.0, ahead of the 0.7.0 cargo had
    systemd-manager-tui  # installs as `systemd-manager-tui`
    flawz                # CVE browser
    dtop                 # docker dashboard
    ducker               # docker container manager
    oxker                # docker container TUI

    # General CLI utilities
    jq
    direnv
    mods

    # Text, search and data tools, moved off `cargo install` on 2026-08-22.
    # Same rule as the earlier batches: nixpkgs src owner/repo checked against
    # what crates.io lists, binary names read from meta.mainProgram, versions
    # compared before adding anything.
    bat          # cat with syntax highlighting
    ripgrep      # installs as `rg`
    tokei        # count lines of code
    grex         # build a regex from examples
    choose       # cut and awk, human-readable
    srgn         # structural text and code edits
    serpl        # search and replace TUI
    swpui        # search and replace TUI; installs as `swp`
    jnv          # interactive jq
    jsongrep     # JSONPath queries; installs as `jg`
    fblog        # JSON log viewer
    toml2json    # built from the crates.io tarball
    csview       # CSV viewer
    xan          # CSV processing
    xleak        # Excel viewer
    hexyl        # hex viewer
    heh          # hex editor
    bingrep      # grep through binaries
    mdbook       # build books from markdown
    mdfried      # markdown viewer with images
    treemd       # markdown navigator
    doxx         # .docx viewer

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
    television  # general purpose fuzzy finder; installs as `tv`

    # Log viewing
    lnav
    hl-log-viewer  # pamburus/hl

    # Terminal & process
    mprocs
    sampler
    ttyd

    # Shell and terminal environment, moved off `cargo install` on 2026-08-22.
    # Same rule as the earlier batches: nixpkgs src owner/repo checked against
    # what crates.io lists, binary names read from meta.mainProgram, and every
    # version matched what cargo had installed.
    #
    # pueue is deliberately not here. /usr/bin/pueued is a hand-made symlink
    # into ~/.cargo/bin, so uninstalling the crate leaves it dangling and the
    # daemon fails to start next time. That one needs the symlink handled with
    # it. topgrade is held back too: it runs the vup whose duration is the
    # measurement this migration is waiting on.
    starship       # prompt; starship-jj already moved in the git batch
    zellij         # terminal workspace
    sheldon        # shell plugin manager
    intelli-shell  # command suggestions
    pay-respects   # command correction. nixpkgs builds the codeberg.org repo,
                   # which is what crates.io lists as homepage; the repository
                   # field points at a GitHub mirror
    navi           # interactive cheatsheet
    tealdeer       # tldr client; installs as `tldr`
    hwatch         # watch with history
    viddy          # watch, modernised. crates.io carries no repository field,
                   # so identity rests on the crate owner matching the src
    just           # command runner
    presenterm     # terminal slideshow
    snipt          # snippet expansion
    kbt            # keyboard tester
    systeroid      # sysctl with a TUI
    genact         # activity generator
    cmd-wrapped    # shell history summary
    theattyr       # VT100 art player

    # Network
    doggo

    # Network and HTTP tools, moved off `cargo install` on 2026-08-22
    xh           # HTTP requests
    atac         # API client, postman-like
    slumber      # HTTP/REST client
    bandwhich    # network utilisation by process
    netscanner   # network scanner
    rustscan     # port scanner. crates.io names rustscan/rustscan, which 301s
                 # to bee-san/RustScan, the repo nixpkgs builds
    ttl          # traceroute/mtr-style TUI
    xfr          # iperf3 alternative
    sshx         # collaborative terminal sharing
    kanha        # web-app pentesting suite
    monolith     # bundle a web page into one HTML file
    tzupdate     # set the timezone from IP geolocation

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
