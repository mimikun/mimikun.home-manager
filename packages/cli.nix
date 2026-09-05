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
    sesh  # joshmedeski/sesh: smart session manager

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

    # Passive subdomain enumeration, added 2026-08-24. subfaster is a fork of
    # subfinder; both are installed because they are configured and sourced
    # separately, and the binaries do not collide.
    subfinder    # projectdiscovery/subfinder
    subfaster    # melvinsh/subfaster, from overlays/prebuilt-github-tools.nix

    # Data conversion
    yj

    # The categories stopped dividing here. Everything below moved off
    # `cargo install` on 2026-08-22 in one batch because no group left was
    # bigger than a handful. Same checks as the earlier batches.

    # LLMs from the terminal
    aichat
    smartcat     # installs as `sc`
    tenere

    # Calculators, dates, calendars
    eva          # built from the crates.io tarball
    fend
    carl         # crates.io points at codeberg, nixpkgs builds the author's
                 # GitHub repo; the crate owner matches both
    bttf

    # Images, screens, colours
    viu
    qrtool
    menyoki
    mcat
    pastel
    t-rec
    code-minimap

    # Development odds and ends
    sccache
    rust-script
    ron-lsp
    desed        # sed debugger
    ghciwatch
    rustlens     # repo renamed vizier -> Rustlens, a 301 confirms it
    erg
    flamelens
    intentrace   # strace, prettified

    # Task tracking
    dstask
    basilk       # minimal kanban TUI
    mask         # task runner defined by a markdown file

    # The last batch of the cargo migration, 2026-08-22. Everything that
    # remains on cargo after this is blocked on something the procedure cannot
    # resolve: no nixpkgs attribute at all, nixpkgs behind the installed
    # version, or the attribute name taken by a different program.

    # Secrets and encryption
    rbw          # bitwarden client. nixpkgs builds git.tozt.net, the author's
                 # own git server; the GitHub repo crates.io names is a mirror
                 # and points its homepage back at it. Ships rbw-agent too
    rage         # encryption; ships rage-keygen too
    passepartui  # TUI for pass
    checkpwn     # built from the crates.io tarball

    # Notes, journals, bookmarks
    tui-journal  # installs as `tjournal`
    bmm          # bookmarks
    kibi         # tiny text editor

    # Dotfiles and toolchains
    dotter       # dotfile templater
    dotslash     # built from the crates.io tarball
    bob-nvim     # neovim version manager; installs as `bob`

    # Reading and social
    lobtui       # lobste.rs
    tuisky       # bluesky
    wthrr        # weather

    # Games and practice
    chess-tui
    tukai        # touch typing
    rustfinity   # built from the crates.io tarball

    # Lookups
    domain-check
    rana         # nostr key mining

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

    # Charm-family TUIs, moved off `gup` on 2026-08-24. Third batch of the Go
    # migration. Same rule as the earlier batches: nixpkgs src owner/repo
    # checked against the import_path in gup.json, binary names read from
    # meta.mainProgram.
    #
    # charm-freeze, not freeze: nixpkgs `freeze` is optiv/Freeze, a shellcode
    # loader. The charmbracelet one is carried under a prefixed attribute and
    # still installs as `freeze`. Looking it up by name alone would have
    # installed an unrelated program.
    #
    # Three of the ten stayed on gup: crush (0.88.1 here vs 0.91.0 there) and
    # pop (0.3.0 vs 0.5.0) would move backwards, and sheets has no attribute.
    # glow goes forward across a major, 2.1.2 to 3.0.0.
    charm-freeze  # charmbracelet/freeze, installs as `freeze`
    glow          # markdown reader
    gum           # shell-script prompts and styling
    nap           # maaslalani/nap, code snippets
    skate         # key-value store
    slides        # maaslalani/slides, terminal presentations
    vhs           # terminal session recorder

    # Recovered by alias on 2026-08-24, batch four of the gup migration. These
    # were all filed as unavailable: matching gup.json against nixpkgs by name
    # either found nothing or found a different project. Searching for the
    # aliased attribute instead turned up the real one, same src owner/repo,
    # same version.
    #
    # Two more were recovered the same way but stay on gup, because nixpkgs
    # trails what is installed: yq-go is 4.53.3 against yq 4.53.6, and bsky-cli
    # is 0.0.81 against bsky 0.0.82.
    fabric-ai  # danielmiessler/fabric, installs as `fabric`; nixpkgs `fabric`
               # is the Python deployment tool
    fm-go      # mistakenelf/fm, installs as `fm`

    # Moved off `gup` on 2026-08-24, batch seven. Cut by source repository
    # rather than by category: one nixpkgs attribute replaces several gup
    # entries, because gup tracks a repository once per command while nixpkgs
    # packages the repository once.
    #
    # age replaces four gup entries - age, age-inspect, age-keygen and
    # age-plugin-batchpass, all from filippo.io/age at 1.3.1 - and adds
    # age-plugin-pq, age-plugin-tag, age-plugin-tagpq and age-plugin-tagtest.
    #
    # murex is pinned in nixpkgs as 7.2.1001, which is commit 8678ad89405c,
    # the exact commit gup's pseudo-version names. docgen comes from the same
    # repository and stays on gup: the nixpkgs derivation builds the shell and
    # does not install it.
    age
    murex

    # From overlays/prebuilt-github-tools.nix
    jfryy-qq       # jq-style querying, installs as qq
    sheepla-pingu  # ping with a penguin, installs as pingu
    misskey-cli
    chmod-cli
    lazy-tmux      # tmux session manager; a Claude Code hook calls it
  ];
}
