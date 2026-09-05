{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Version control & dotfiles
    chezmoi
    gh
    ghq
    hk  # jdx/hk: git hook manager

    # Git & Jujutsu, moved off `cargo install` on 2026-08-22. Same rule as the
    # earlier batches: nixpkgs src owner/repo checked against what crates.io
    # lists, binary names read from meta.mainProgram, and every version matched
    # what cargo had installed.
    #
    # jujutsu, not jj: nixpkgs `jj` is tidwall's JSON Stream Editor, which ships
    # a binary called `jj` as well. Name and binary both match the Jujutsu crate
    # while the contents do not.
    jujutsu       # jj-cli crate, installs as `jj`
    starship-jj   # jj prompt segment for starship
    gitu          # magit-like TUI
    serie         # commit graph
    git-graph     # src moved mlange-42 -> git-bahn, a 301 confirms it
    git-interactive-rebase-tool  # installs as `interactive-rebase-tool`
    worktrunk     # worktree manager, installs as `wt`
    gfold         # status across many repositories
    deadbranch    # prunes stale branches
    gitnr         # builds .gitignore files from templates
    gitlogue      # commit replay
    onefetch      # repository summary
    koji          # conventional commit prompt

    # Git & GitHub, moved off `gup` on 2026-08-23. First batch of the Go
    # migration. Same rule as the cargo batches: nixpkgs src owner/repo checked
    # against what gup.conf fetches, binary names read from meta.mainProgram.
    #
    # Name matching alone was not enough on this population. Of the 51 gup tools
    # whose name exists in nixpkgs, 11 are a different project entirely - `pam`
    # is linux-pam, `surge` is the synthesiser, `fabric` is the Python
    # deployment tool. src.url is what settles it.
    act3            # last 3 runs of a GitHub Actions workflow
    ghfetch         # neofetch-style GitHub user info
    gitsnip         # download a single folder out of a repository
    gwq             # git worktree manager with a fuzzy finder
    pg-schema-diff  # stripe/pg-schema-diff, Postgres schema migrations
    hut             # sr.ht CLI; nixpkgs fetches from git.sr.ht, not a mirror

    # Recovered by alias on 2026-08-24, batch four of the gup migration. These
    # were all filed as unavailable: matching gup.json against nixpkgs by name
    # either found nothing or found a different project. Searching for the
    # aliased attribute instead turned up the real one, same src owner/repo,
    # same version.
    #
    # Two more were recovered the same way but stay on gup, because nixpkgs
    # trails what is installed: yq-go is 4.53.3 against yq 4.53.6, and bsky-cli
    # is 0.0.81 against bsky 0.0.82.
    go-motion   # fatih/motion, installs as `motion`; nixpkgs `motion` is the
                # Motion-Project camera daemon
    meteor-git  # stefanlogue/meteor, installs as `meteor`; the -git suffix is
                # the attribute name, not a VCS snapshot

    # Diffs & merge tools
    delta       # git-delta crate
    difftastic  # installs as `difft`
    oyui        # merge tool and diff editor for Jujutsu

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

    # Linters & formatters, moved off `gup` on 2026-08-24. Second batch of the
    # Go migration. Same rule as batch 1: every nixpkgs src owner/repo checked
    # against the import_path in gup.json, binary names read from
    # meta.mainProgram.
    #
    # Two import paths are vanity domains that resolve elsewhere, so owner/repo
    # cannot be extracted from the path itself: mvdan.cc/gofumpt is
    # mvdan/gofumpt and mvdan.cc/sh/v3 is mvdan/sh.
    #
    # Only tools where nixpkgs is at or ahead of what gup has installed. Three
    # candidates were left on gup because nixpkgs trails them: golangci-lint
    # (2.12.2 vs 2.13.1), keep-sorted (0.9.0 vs 0.10.0) and revive (1.15.0 vs
    # 1.16.0). pinact moves here and goes forward a major version, 3.10.1 to
    # 4.1.1.
    actionlint
    asmfmt
    editorconfig-checker  # v3, installs as `editorconfig-checker`
    ghalint
    gofumpt
    pinact
    shfmt                 # mvdan/sh
    yamlfmt

    # Moved off `cargo install` on 2026-08-22. Every src owner/repo was checked
    # against what crates.io lists for the crate, and every version matched what
    # cargo had installed. treefmt is deliberately absent: nixpkgs only carries
    # the Go rewrite (2.5.0) while cargo has the Rust original (0.6.1), so that
    # one is a major rewrite to adopt, not a move.
    typos           # typos-cli crate
    taplo           # taplo-cli crate, TOML toolkit
    committed       # lints commit messages against conventional commits
    commitlint-rs   # installs as `commitlint`
    selene          # Lua linter
    stylua          # Lua formatter
    shellharden     # corrective bash syntax highlighter
    lychee          # link checker
    pylyzer         # Python static analyzer
    bacon           # background cargo check
    emmylua-check   # emmylua_check crate
    emmylua-ls      # emmylua_ls crate
    emmylua-doc-cli # emmylua_doc_cli crate

    # Containers and Kubernetes, moved off `gup` on 2026-08-24. Batch five of
    # the Go migration. Same rule as the earlier batches: nixpkgs src
    # owner/repo checked against the import_path in gup.json.
    #
    # ktop is the one to read twice. Its meta.mainProgram is kubectl-ktop, not
    # ktop, which reads like the command would disappear. The derivation ships
    # both names, so `ktop` keeps working - mainProgram names the primary
    # binary, it does not enumerate them.
    #
    # lfk stayed on gup: nixpkgs has 0.14.19 against the installed 0.18.1.
    dive            # image layer explorer
    dockerfile-pin  # azu/dockerfile-pin, pins Dockerfile base image digests
    ktop            # cluster top; also installs as kubectl-ktop
    ku              # bjarneo/ku, kubernetes TUI
    layerx          # deveshctl/layerx, image layer inspection
    lazydocker      # docker TUI
    sou             # knqyf263/sou, browse container image filesystems

    # Kubernetes
    kubectx
    k9s

    # Load testing
    vegeta
    k6

    # Go development tools, moved off `gup` on 2026-08-24. Batch six of the Go
    # migration. Same rule as the earlier batches: nixpkgs src owner/repo
    # checked against the import_path in gup.json.
    #
    # delve, not dlv: nixpkgs has no `dlv` attribute at all. The package is
    # named after the project and installs dlv and dlv-dap. Matching on the
    # command name would have missed it, the same way fm-go and go-motion were
    # missed until batch four.
    #
    # gopls resolves through a vanity domain: golang.org/x/tools is
    # github.com/golang/tools, which is what nixpkgs fetches, tagged
    # gopls/v0.23.0.
    #
    # gotags is pinned to a bare commit in nixpkgs rather than a tag. That
    # commit is v1.4.1, the same release gup installed.
    delve         # installs dlv and dlv-dap
    gomodifytags
    gopls
    gore          # x-motemen/gore, Go REPL
    gotags
    gotip         # lusingander/gotip, not the golang.org toolchain fetcher
    impl          # josharian/impl, generate method stubs
    mage

    # Languages
    gleam
    ghcitty  # mattlianje/ghcitty: a friendlier GHCi. Built from the upstream
             # flake, declared as an input in flake.nix; nixpkgs has no
             # attribute for it

    # Issue & change tracking
    git-bug
    jjui
    diffnav
    tuicr  # review AI-generated diffs like a pull request

    # Forge CLIs, moved off `cargo install` on 2026-08-22
    codeberg-cli   # installs as `berg`
    forgejo-cli    # installs as `fj`
    wrkflw         # runs GitHub Actions workflows locally

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
    ast-grep     # npm: @ast-grep/cli; also covers the ast-grep crate, whose
                 # second binary `sg` nixpkgs does not ship and we do not keep
    bats         # npm: bats
    prettier     # npm: prettier
    prek         # npm: @j178/prek
    httpyac      # npm: httpyac
    mermaid-cli  # npm: @mermaid-js/mermaid-cli, installs as mmdc
    codegraph    # npm: @colbymchenry/codegraph
    pi-coding-agent  # npm: @earendil-works/pi-coding-agent; installs as pi

    # From overlays/prebuilt-github-tools.nix
    aqua-registry-tool  # installs as argd
    reminder-lint
    cmdx
    gaze
    dagu
    godap
    pkgx
    termkit-gama        # GitHub Actions TUI, installs as gama
  ]
  # Kept off the Linux list on purpose: nixpkgs marks xcbeautify
  # aarch64-darwin-only, so naming it unconditionally breaks the build here.
  # It formats xcodebuild output, which is useless without Xcode anyway.
  #
  # It is written down rather than dropped because this flake currently builds
  # one system ("x86_64-linux" in flake.nix) and a Mac would mean adding
  # another. Carrying the guard now means the tool arrives with that config
  # instead of having to be rediscovered -- it came off aqua, which is going
  # away, and nothing else would remember it.
  ++ pkgs.lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
    pkgs.xcbeautify  # cpisciotta/xcbeautify: formats xcodebuild output
  ];
}
