{ pkgs, ... }:
{
  # Tools moved off `gup` one at a time, once the cheap cuts ran out.
  #
  # The earlier batches were cut by category, by aliased attribute name and by
  # source repository, and each of those angles is now spent. What remains has
  # nothing in common except where it used to be installed from, so it lives
  # here rather than being scattered across the category files under a label
  # that would not be true.
  #
  # Everything in this file cleared the same two checks, mechanically, against
  # the flake's nixpkgs:
  #
  #   - the nixpkgs `src` fetches the owner/repo that the `import_path` in
  #     gup.json resolves to
  #   - the nixpkgs version equals the version gup had installed, so nothing
  #     moves in either direction
  #
  # eget, gmailctl and scc carry no meta.mainProgram. Their bin directories
  # were listed instead: eget ships eget, gmailctl ships gmailctl and
  # gmailctl-config-migrate, scc ships scc and badges. mainProgram names a
  # primary binary and does not enumerate what a package installs, so an empty
  # one is not evidence of a missing command.
  #
  # Descriptions are nixpkgs' own meta.description, not a summary written here.
  home.packages = with pkgs; [
    algia            # CLI application for nostr
    ali              # Generate HTTP load and plot the results in real-time
    andcli           # 2FA TUI for your shell
    bit              # Command-line tool for git
    cariddi          # Crawler for URLs and endpoints
    clive            # Automates terminal operations
    curlie           # Frontend to curl that adds the ease of use of httpie, without compromising on features and performance
    diffyml          # Structural YAML diff tool with Kubernetes awareness and CI-friendly output
    diskbloom        # A pastel treemap TUI that shows what's eating your disk
    dstp             # Run common networking tests against your site
    dyff             # Diff tool for YAML files, and sometimes JSON
    e1s              # Easily Manage AWS ECS Resources in Terminal
    ec               # Easy terminal-native 3-way git conflict resolver vim-like workflow
    efm-langserver   # General purpose Language Server
    eget             # Easily install prebuilt binaries from GitHub
    f2               # Command-line batch renaming tool
    fence            # Lightweight, container-free sandbox for running commands with network and filesystem restrictions
    fq               # jq for binary formats
    gat              # Cat alternative written in Go
    git-wt           # Git subcommand that makes git worktree simple
    gmailctl         # Declarative configuration for Gmail filters
    gokey            # Vault-less password store
    gopass           # Slightly more awesome Standard Unix Password Manager for Teams. Written in Go
    gotop            # Terminal based graphical activity monitor inspired by gtop and vtop
    gowall           # Tool to convert a Wallpaper's color scheme / palette
    gtrash           # Trash CLI manager written in Go
    hours            # No-frills time tracking toolkit for command line nerds
    httptap          # View HTTP/HTTPS requests made by any Linux program
    jump             # Navigate directories faster by learning your habits
    lazygit          # Simple terminal UI for git commands
    mani             # CLI tool to help you manage multiple repositories
    minify           # Go minifiers for web formats
    mufetch          # Neofetch-style CLI for music metadata with album art display
    nerdlog          # Fast, remote-first, multi-host TUI log viewer with timeline histogram
    ov               # Feature-rich terminal-based text viewer
    peco             # Simplistic interactive filtering tool
    pipeform         # TUI for Terraform runtime progress
    plow             # High-performance HTTP benchmarking tool that includes a real-time web UI and terminal display
    pomo             # Customizable TUI Pomodoro timer with ASCII art, progress bar, notifications, and stats
    pvetui           # Terminal UI for Proxmox Virtual Environment
    pwdsafety        # Command line tool checking password safety
    reader           # Lightweight tool offering better readability of web pages on the CLI
    scc              # Very fast accurate code counter with complexity calculations and COCOMO estimates written in pure Go
    snitch           # friendlier ss / netstat for humans
    sq               # Swiss army knife for data
    sqlc             # Generate type-safe code from SQL
    todoist          # Todoist CLI Client
    tuios            # Terminal-based window manager
    typtea           # Terminal-based typing speed test with multi-language support
    vim-startuptime  # Small Go program for better `vim --startuptime` alternative
    walk             # Terminal file manager
    whosthere        # Local Area Network discovery tool
    wtp              # Git worktree CLI with automated setup, branch tracking, and navigation
    wuzz             # Interactive cli tool for HTTP inspection
    xc               # Markdown defined task runner
    yaml2json        # Convert yaml to json

    # Batch nine, 2026-08-24. These did not clear the two checks above as
    # written, and each needed one extra fact before it could move.
    #
    # Three had a src owner that disagreed with the import_path. GitHub
    # answered for all three: darkhz/bluetuith now redirects to
    # bluetuith-org/bluetuith, gchaincl/httplab to qustavo/httplab, and
    # patrickhener/goshs (which goshs.de fronts) to goshs-labs/goshs. A 301
    # means a rename, not a different project, and all three are at the same
    # version gup had.
    #
    # Two move forward across a major version rather than staying put: croc
    # 10.7.0 to 11.1.0 and gollama 1.37.5 to 2.0.5. Worth knowing before the
    # next time either one is used.
    bluetuith  # TUI-based Bluetooth connection manager
    croc       # Easily and securely send things from one computer to another
    gollama    # Go manage your Ollama models
    goshs      # Simple, yet feature-rich web server written in Go
    httplab    # Interactive WebServer
  ];
}
