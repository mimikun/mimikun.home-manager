{ pkgs, ... }:
{
  # The crates nixpkgs has no attribute for, packaged from their upstream
  # release binaries in overlays/prebuilt-rust-tools.nix. Kept in their own file
  # because they share a reason for existing rather than a subject: every one of
  # them is here because nixpkgs does not carry it.
  #
  # A comment after a name is the command it installs, where that differs from
  # the attribute.
  # wisu is absent as well: its newest crate is 0.1.7 while upstream's newest
  # release is 0.1.6, so moving it would go backwards.
  #
  # pay-respects' two module crates are absent: the nixpkgs pay-respects added
  # in the earlier batch already ships _pay-respects-fallback-100-request-ai and
  # _pay-respects-module-100-runtime-rules, and buildEnv refuses the duplicate.
  home.packages = with pkgs; [
    ThreatDeck
    ag  # agrind
    aim
    apisnip
    basalt-tui  # basalt
    bitchat-tui
    blogr-cli  # blogr
    bookokrat
    brush-shell  # brush
    ccsum
    cctx
    cell-sheet-tui  # cell
    clin-rs  # clin
    comchan
    crmux
    cship
    darya
    ddv
    dealve-tui  # dealve
    depsguard
    diffai
    diffx
    diskonaut
    dnsglobe
    dockerfile-roast  # droast
    dotstate
    du-dust  # dust
    dusage
    ecscope
    eilmeldung
    elio
    envex  # envx
    envfetch
    epiq
    fd-find  # fd
    flowrs-tui  # flowrs
    ftdv
    gengo-bin  # gengo
    gistui
    gitpane
    gitv-tui  # gitv
    gitwig
    glab-tui-crate  # glab-tui
    gnomad
    gwm-cli  # gwm
    harper-ls
    hazelnut
    hexapoda
    hf
    hysp
    ibtop
    imdl
    inspect-cert-chain
    iwes
    jjj
    jwt-ui  # jwtui
    kite-tui
    krafna
    lawkit
    lazycelery
    livediff
    mairu
    mamediff
    mcdu
    mcp-cli  # mcp-probe
    merman-cli
    moltbook-tui  # moltbook
    mq-run  # mq
    needs
    netwatch-tui  # netwatch
    nu
    nu-plugin-formats  # nu_plugin_formats
    nu-plugin-gstat  # nu_plugin_gstat
    nu-plugin-inc  # nu_plugin_inc
    nu-plugin-polars  # nu_plugin_polars
    nu-plugin-query  # nu_plugin_query
    oeis-tui  # oeis
    omp-manager
    outside
    oyo  # oy
    parallels
    parqeye
    perch
    pez
    pgfmt
    pitchfork-cli  # pitchfork
    punktf
    purple-ssh  # purple
    railwayapp  # railway
    rucola-notes  # rucola
    rusk-task  # rusk
    rusticon
    rustnet-monitor  # rustnet
    rustormy
    rvpm
    scope-monitor  # scope
    scraps
    seednaut
    sharedserver
    siggy
    sigrs  # sig
    sigye
    similarity-ts
    soundscope
    spectatui
    splashboard
    ssh-list
    strace-tui
    superseedr
    swaptop
    tatuin
    taws
    tod
    tredis
    turm
    uuinfo
    vibe-ticket
    vortix
    vscli
    wireman
    work-tuimer
    xsv
  ];
}
