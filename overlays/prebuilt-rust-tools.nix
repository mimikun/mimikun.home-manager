# Crates that are installed from crates.io but have no nixpkgs attribute, taken
# from their upstream release binaries instead. The builder is shared with
# prebuilt-github-tools.nix and lives in ./mk-prebuilt.nix.
#
# These are the leftovers of the cargo-to-nixpkgs migration: nixpkgs simply does
# not package them. Where upstream publishes a Linux x86_64 asset, packaging it
# here costs a fetch and a hash and no compilation, which is the whole point --
# building them from source would move the build time from cargo to nix rather
# than removing it.
#
# Delete an entry when nixpkgs gains an attribute for the same program. Check
# that it is the same program: three names in the earlier batches (jj, tgt,
# zenith) belong to entirely different software in nixpkgs.
final: prev:
let
  mk = import ./mk-prebuilt.nix prev;
in
{

  ThreatDeck = mk {
    pname = "ThreatDeck";
    version = "0.6.0";
    libs = [ prev.openssl ];
    bare = true;
    url = "https://github.com/gripebomb/ThreatDeck/releases/download/v0.6.0/ThreatDeck-x86_64-linux";
    hash = "sha256-dzTgZ6a6fm2Xf/hToZWKaU7pPVoRLPjwH7OoJbwLMoc=";
    description = "Terminal-based threat intelligence monitoring and alerting p";
    homepage = "https://github.com/gripebomb/ThreatDeck";
  };

  ag = mk {
    pname = "ag";
    version = "0.19.5";
    bin = "agrind";
    url = "https://github.com/rcoh/angle-grinder/releases/download/v0.19.6/agrind-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-P+9lZVTCOYD8vo4UDZflY7e1O5QbdI02axrCig2x4is=";
    description = "CLI App to slice and dice logfiles";
    homepage = "https://github.com/rcoh/angle-grinder";
  };

  aim = mk {
    pname = "aim";
    version = "1.8.8";
    url = "https://github.com/mihaigalos/aim/releases/download/1.8.8/aim-1.8.8-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-706w3aJmPgh10ghNCmUHXhJU0D3mWuNH+aD0ZUFWn+I=";
    description = "🎯 A command line download/upload tool with resume";
    homepage = "https://github.com/mihaigalos/aim";
  };

  apisnip = mk {
    pname = "apisnip";
    version = "1.4.60";
    url = "https://github.com/Tuurlijk/apisnip/releases/download/v1.4.60/apisnip-linux-musl-x86_64.tar.gz";
    hash = "sha256-pNZ2LbbUJmfAZw+PCkQyhtrldLiDcck9M/qqOOq0PFI=";
    description = "A terminal user interface (TUI) tool for trimming OpenAPI sp";
    homepage = "https://github.com/Tuurlijk/apisnip";
  };

  basalt-tui = mk {
    pname = "basalt-tui";
    version = "0.12.7";
    bin = "basalt";
    subdir = "basalt-0.12.7-x86_64-unknown-linux-musl";
    url = "https://github.com/erikjuhani/basalt/releases/download/basalt/v0.12.7/basalt-0.12.7-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-PtJ4h2lGM4fCBQRAsHhHa3zkliWLN6dVmqVIPKKQbPg=";
    description = "Basalt TUI application for Obsidian notes";
    homepage = "https://github.com/erikjuhani/basalt";
  };

  bitchat-tui = mk {
    pname = "bitchat-tui";
    version = "0.1.0";
    url = "https://github.com/vaibhav-mattoo/bitchat-tui/releases/download/v0.1.0/bitchat-tui-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-ajm9WEogOylKi6hhvT+cJ9pTDnEml1tPq2s5y9fUrX4=";
    description = "A terminal user interface (TUI) chat application using Bluet";
    homepage = "https://github.com/vaibhav-mattoo/bitchat-tui";
  };

  blogr-cli = mk {
    pname = "blogr-cli";
    version = "0.5.1";
    bin = "blogr";
    url = "https://github.com/bahdotsh/blogr/releases/download/v0.5.1/blogr-linux-x86_64.tar.gz";
    hash = "sha256-ux8eetu+rr0SpewWwzLqHWnRRd87Ozxy9ztstxHcpF8=";
    description = "A CLI static site generator for blogs";
    homepage = "https://github.com/bahdotsh/blogr";
  };

  bookokrat = mk {
    pname = "bookokrat";
    version = "0.3.12";
    url = "https://github.com/bugzmanov/bookokrat/releases/download/v0.3.12/bookokrat-v0.3.12-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-ee6a+2h2XSLFS43aH8XWahT0i5BW6utkDJOkEcgxOdU=";
    description = "A terminal-based EPUB/PDF Books reader";
    homepage = "https://github.com/bugzmanov/bookokrat";
  };

  brush-shell = mk {
    pname = "brush-shell";
    version = "0.4.0";
    bin = "brush";
    url = "https://github.com/reubeno/brush/releases/download/brush-shell-v0.4.0/brush-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-c5eqLOzvQ+04BwkStthl/b4j3Aj9otYUjYzujcEtFe4=";
    description = "Rust-implemented shell focused on POSIX and bash compatibili";
    homepage = "https://github.com/reubeno/brush";
  };

  ccsum = mk {
    pname = "ccsum";
    version = "0.2.3";
    bare = true;
    url = "https://github.com/sevenc-nanashi/ccsum/releases/download/v0.2.3/ccsum-linux-x86_64";
    hash = "sha256-Be3Pywg48Ysli9vzaaLiL/w5YkDAe3hQRVNYFCoJw5U=";
    description = "Convenient Checksum Utility";
    homepage = "https://github.com/sevenc-nanashi/ccsum";
  };

  cctx = mk {
    pname = "cctx";
    version = "0.1.6";
    bare = true;
    url = "https://github.com/nwiizo/cctx/releases/download/v0.1.6/cctx-linux-x86_64-musl";
    hash = "sha256-xJ1gABLAJparsGrUMhn5Ex5PxPkMyBhYecaFhPjIuvs=";
    description = "Claude Code context manager for switching between multiple s";
    homepage = "https://github.com/nwiizo/cctx";
  };

  cell-sheet-tui = mk {
    pname = "cell-sheet-tui";
    version = "0.5.1";
    bin = "cell";
    subdir = "cell-v0.5.1-x86_64-unknown-linux-gnu";
    url = "https://github.com/garritfra/cell/releases/download/v0.5.1/cell-v0.5.1-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-TEfWzmQAk+BlR/3IkZii0tyPOIjxlPcEzUapQ51kQig=";
    description = "A terminal spreadsheet editor with Vim-like keybindings";
    homepage = "https://github.com/garritfra/cell";
  };

  clin-rs = mk {
    pname = "clin-rs";
    version = "0.11.1";
    libs = [ prev.openssl prev.zlib ];
    bin = "clin";
    url = "https://github.com/reekta92/clin-rs/releases/download/v0.11.2/clin-rs-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-+MD0OLhVSeefX0vdlxy0gmrXy/P4b0VY4pPPsb7Th/A=";
    description = "Feature-packed terminal note management app inspired by Obsi";
    homepage = "https://github.com/reekta92/clin-rs";
  };

  comchan = mk {
    pname = "comchan";
    version = "0.14.0";
    libs = [ prev.dbus prev.fontconfig prev.systemdLibs ];
    subdir = "comchan-x86_64-unknown-linux-gnu";
    url = "https://github.com/Vaishnav-Sabari-Girish/ComChan/releases/download/v0.14.0/comchan-x86_64-unknown-linux-gnu.tar.xz";
    hash = "sha256-YVJzLFKxY2wdLID0KeygEIKBmKYYtel41bpnetD4FEY=";
    description = "A Blazingly Fast and Minimal Serial Monitor for Embedded App";
    homepage = "https://github.com/Vaishnav-Sabari-Girish/ComChan";
  };

  crmux = mk {
    pname = "crmux";
    version = "0.20.3";
    libs = [ prev.openssl ];
    url = "https://github.com/maedana/crmux/releases/download/v0.20.3/crmux-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-gmwvbMLJzBNq/nNMAKCOfYZ+VPNQrJqiQDt1sqIjJHE=";
    description = "A session multiplexer for Claude Code in tmux";
    homepage = "https://github.com/maedana/crmux";
  };

  cship = mk {
    pname = "cship";
    version = "1.8.1";
    bare = true;
    url = "https://github.com/stephenleo/cship/releases/download/v1.8.1/cship-x86_64-unknown-linux-musl";
    hash = "sha256-854EI6ImCyiGuolSUE+fPhas1AcYNPpBn/715M+ExQY=";
    description = "A beautiful, fully customizable statusline for Claude Code —";
    homepage = "https://github.com/stephenleo/cship";
  };

  darya = mk {
    pname = "darya";
    version = "0.1.6";
    url = "https://github.com/mrkatebzadeh/darya/releases/download/v0.1.6/darya-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-EzQZ3lx7Pu+jGfxuqCOwz6FkvfKLy1lIrzq0FEyAjOI=";
    description = "A fast, keyboard-driven disk usage explorer built on ratatui";
    homepage = "https://github.com/mrkatebzadeh/darya";
  };

  ddv = mk {
    pname = "ddv";
    version = "0.3.1";
    url = "https://github.com/lusingander/ddv/releases/download/v0.3.1/ddv-0.3.1-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-n4nV03xCI6Uzfu5JMDC0MRMCFpQ4HAA/YmqLauftOE4=";
    description = "Terminal DynamoDB Viewer";
    homepage = "https://github.com/lusingander/ddv";
  };

  dealve-tui = mk {
    pname = "dealve-tui";
    version = "1.0.2";
    libs = [ prev.openssl ];
    bin = "dealve";
    bare = true;
    url = "https://github.com/kurama/dealve-tui/releases/download/v1.0.2/dealve-linux-x86_64";
    hash = "sha256-AuuK/RDxF0A6fr0RMBmQ175lPCR8G9v1hP/f1VlMWk0=";
    description = "Delve into game deals from your terminal 👾";
    homepage = "https://github.com/kurama/dealve-tui";
  };

  depsguard = mk {
    pname = "depsguard";
    version = "0.1.40";
    url = "https://github.com/arnica/depsguard/releases/download/v0.1.40/depsguard-linux-amd64-musl.tar.gz";
    hash = "sha256-wOBhbsCASfjMKfL3vzZEmFR04FLiwvaH1nybRmwmSCA=";
    description = "Harden package manager configs against supply chain attacks";
    homepage = "https://github.com/arnica/depsguard";
  };

  diffai = mk {
    pname = "diffai";
    version = "0.5.1";
    url = "https://github.com/kako-jun/diffai/releases/download/v0.5.1/diffai-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-Kl+BBbZ5YUOW7AO2kH6FxkKKg6bIe38CBKQYRfiPoSQ=";
    description = "AI/ML model diff CLI - PyTorch, Safetensors, NumPy, MATLAB c";
    homepage = "https://github.com/kako-jun/diffai";
  };

  diffx = mk {
    pname = "diffx";
    version = "0.7.1";
    url = "https://github.com/kako-jun/diffx/releases/download/v0.7.1/diffx-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-FRs5qkK9gIq6cuSicvtdzgdSd6PzUVk1Ef6VztYAYy4=";
    description = "Smart diff for config files. Compare JSON/YAML/TOML/XML sema";
    homepage = "https://github.com/kako-jun/diffx";
  };

  diskonaut = mk {
    pname = "diskonaut";
    version = "0.11.0";
    url = "https://github.com/imsnif/diskonaut/releases/download/0.11.0/diskonaut-0.11.0-unknown-linux-musl.tar.gz";
    hash = "sha256-7E8BA7XlB+FXUrsZWGRLwWjWrSd8Wd0Sp3H7KBeL9yU=";
    description = "Terminal disk space visual navigator";
    homepage = "https://github.com/imsnif/diskonaut";
  };

  dnsglobe = mk {
    pname = "dnsglobe";
    version = "0.5.0";
    subdir = "dnsglobe-x86_64-unknown-linux-gnu";
    url = "https://github.com/514-labs/dnsglobe/releases/download/v0.5.0/dnsglobe-x86_64-unknown-linux-gnu.tar.xz";
    hash = "sha256-srKTlyRj3u6EX/18HBIX7/ZFv9X37FSdmbqDDcTAtZg=";
    description = "Global DNS propagation checker TUI — watch a DNS record prop";
    homepage = "https://github.com/514-labs/dnsglobe";
  };

  dockerfile-roast = mk {
    pname = "dockerfile-roast";
    version = "1.6.0";
    bin = "droast";
    bare = true;
    url = "https://github.com/immanuwell/dockerfile-roast/releases/download/1.6.1/droast-linux-x86_64";
    hash = "sha256-UwIvLd3beavWzjx0pwPQDYB+uryPcFlcnIuKXyO9kf4=";
    description = "A Dockerfile linter with personality — catches bad practices";
    homepage = "https://github.com/immanuwell/dockerfile-roast";
  };

  dotstate = mk {
    pname = "dotstate";
    version = "0.3.4";
    url = "https://github.com/serkanyersen/dotstate/releases/download/v0.3.4/dotstate-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-+o0fSidLH7VLmdg6KVeYylxVEfsGqBXIKSDOcef5KCg=";
    description = "A modern, secure, and user-friendly dotfile manager built wi";
    homepage = "https://github.com/serkanyersen/dotstate";
  };

  du-dust = mk {
    pname = "du-dust";
    version = "1.2.4";
    bin = "dust";
    subdir = "dust-v1.2.5-x86_64-unknown-linux-musl";
    url = "https://github.com/bootandy/dust/releases/download/v1.2.5/dust-v1.2.5-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-eYE7V0P6seBMHZw0BCqrhl2+Ce+3Zxnnx9JgVohQ+rw=";
    description = "A more intuitive version of du";
    homepage = "https://github.com/bootandy/dust";
  };

  dusage = mk {
    pname = "dusage";
    version = "0.4.1";
    url = "https://github.com/mihaigalos/dusage/releases/download/0.4.1/dusage-0.4.1-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-Yz2kot1qXlygc+QQ13QAJwWgeKakHKOA+f+Kh6+W7j0=";
    description = "💾 A command line disk usage information tool: disk usage (fo";
    homepage = "https://github.com/mihaigalos/dusage";
  };

  ecscope = mk {
    pname = "ecscope";
    version = "0.4.1";
    subdir = "ecscope-x86_64-unknown-linux-musl";
    url = "https://github.com/dhth/ecscope/releases/download/v0.4.1/ecscope-x86_64-unknown-linux-musl.tar.xz";
    hash = "sha256-ncEqsOkXE+IhLDEU4SREZr7hf3ESRBm46fZEU0gAJKA=";
    description = "ecscope lets you monitor AWS ECS resources from the terminal";
    homepage = "https://github.com/dhth/ecscope";
  };

  eilmeldung = mk {
    pname = "eilmeldung";
    version = "1.7.2";
    subdir = "eilmeldung";
    url = "https://github.com/christo-auer/eilmeldung/releases/download/1.7.2/eilmeldung-x86_64-unknown-linux-musl-1.7.2.tar.gz";
    hash = "sha256-4R9JlABFI1AuDFfopuW54Kagy8qtWTRrOoz0/WvqkEk=";
    description = "a feature-rich TUI RSS Reader based on the news-flash librar";
    homepage = "https://github.com/christo-auer/eilmeldung";
  };

  elio = mk {
    pname = "elio";
    version = "1.11.2";
    subdir = "elio-1.11.2-x86_64-unknown-linux-gnu";
    url = "https://github.com/elio-fm/elio/releases/download/v1.11.2/elio-1.11.2-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-9cW/xUA9p0LEYI3/j4MGPVZvcyJpV1JYKYBuHur4sTM=";
    description = "Snappy, batteries-included terminal file manager with rich p";
    homepage = "https://github.com/elio-fm/elio";
  };

  envex = mk {
    pname = "envex";
    version = "0.6.2";
    bin = "envx";
    bare = true;
    url = "https://github.com/mikeleppane/envx/releases/download/v0.6.2/envx-linux-amd64";
    hash = "sha256-QU9kOD7JZj90skLr4JxpfyyrMsHpXayM30flNg0pL0I=";
    description = "A modern, cross-platform environment variable manager with T";
    homepage = "https://github.com/mikeleppane/envx";
  };

  envfetch = mk {
    pname = "envfetch";
    version = "2.1.2";
    bare = true;
    url = "https://github.com/ankddev/envfetch/releases/download/v2.1.2/envfetch-linux-amd64";
    hash = "sha256-LTw9eIaPHXWEZuMYUhwt3lxKoqHH3+i0A69oqcD5nVY=";
    description = "Lightweight cross-platform CLI tool for working with environ";
    homepage = "https://github.com/ankddev/envfetch";
  };

  epiq = mk {
    pname = "epiq";
    version = "0.1.0";
    subdir = "epiq-x86_64-unknown-linux-musl";
    url = "https://github.com/ynqa/empiriqa/releases/download/v0.1.0/epiq-x86_64-unknown-linux-musl.tar.xz";
    hash = "sha256-K1rQY8d7aktWiKidAlNAojRhoGwOOKwquqRm9fx8J2w=";
    description = "Laboratory for pipeline construction with feedback";
    homepage = "https://github.com/ynqa/empiriqa";
  };

  fd-find = mk {
    pname = "fd-find";
    version = "10.4.2";
    bin = "fd";
    subdir = "fd-v10.4.2-x86_64-unknown-linux-musl";
    url = "https://github.com/sharkdp/fd/releases/download/v10.4.2/fd-v10.4.2-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-4yV9SOKaa+llGH29JM6a9WTg/mez5zyb3NGA9OwRvd4=";
    description = "fd is a simple, fast and user-friendly alternative to find";
    homepage = "https://github.com/sharkdp/fd";
  };

  flowrs-tui = mk {
    pname = "flowrs-tui";
    version = "0.13.5";
    libs = [ prev.openssl ];
    bin = "flowrs";
    subdir = "flowrs-tui-x86_64-unknown-linux-gnu";
    url = "https://github.com/jvanbuel/flowrs/releases/download/flowrs-tui-v0.13.5/flowrs-tui-x86_64-unknown-linux-gnu.tar.xz";
    hash = "sha256-WU5rVpksZfYeHLllEH1ekHLcEcOOBqrnw9g9DKr5RWY=";
    description = "Flowrs is a Terminal User Interface (TUI) for Apache Airflow";
    homepage = "https://github.com/jvanbuel/flowrs";
  };

  ftdv = mk {
    pname = "ftdv";
    version = "0.1.2";
    url = "https://github.com/wtnqk/ftdv/releases/download/v0.1.2/ftdv-0.1.2-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-Q7MYpKwIN+kLJM9x/4FD3mHeDY7vt8d3unCZlbh84Ro=";
    description = "A terminal-based file tree diff viewer with flexible diff to";
    homepage = "https://github.com/wtnqk/ftdv";
  };

  gengo-bin = mk {
    pname = "gengo-bin";
    version = "0.14.3";
    bin = "gengo";
    url = "https://github.com/spenserblack/gengo/releases/download/v0.14.3/gengo-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-iG+XjM46pLWDJoICz9Q5syCzrBzZX2Dw5dkbA7XeNFY=";
    description = "Get the language distribution stats of your repository";
    homepage = "https://github.com/spenserblack/gengo";
  };

  gistui = mk {
    pname = "gistui";
    version = "0.17.1";
    subdir = "gistui-v0.18.0-x86_64-unknown-linux-gnu";
    url = "https://github.com/akunzai/gistui/releases/download/v0.18.0/gistui-v0.18.0-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-NnEUYgxPeWHwk7D0UrBm88TafqEFbqfKqGMx4HGR2rw=";
    description = "A terminal UI for managing GitHub Gists";
    homepage = "https://github.com/akunzai/gistui";
  };

  gitpane = mk {
    pname = "gitpane";
    version = "0.12.0";
    url = "https://github.com/affromero/gitpane/releases/download/v0.13.0/gitpane-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-0LbK/jOyfmwI3mt579qXG4XnlBLivmAaX4c3cG+Gplw=";
    description = "Multi-repo Git workspace dashboard TUI";
    homepage = "https://github.com/affromero/gitpane";
  };

  gitv-tui = mk {
    pname = "gitv-tui";
    version = "0.4.5";
    bin = "gitv";
    url = "https://github.com/jayanaxhf/gitv/releases/download/gitv-tui-v0.4.5/gitv-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-QcgJv0z3l1TCUiY7KOl7avkbtQhvY9oRRo40q1jOh5o=";
    description = "A terminal-based GitHub client built with Rust and Ratatui";
    homepage = "https://github.com/jayanaxhf/gitv";
  };

  gitwig = mk {
    pname = "gitwig";
    version = "2.5.9";
    url = "https://github.com/tareqmy/gitwig/releases/download/v2.5.9/gitwig-v2.5.9-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-6OYT6LzadGUVAZVL3Rk5dDHSYwRBDRAUaa/ykUaVa0o=";
    description = "a rust based tui, an alternative to sourcetree and gitui";
    homepage = "https://github.com/tareqmy/gitwig";
  };

  glab-tui-crate = mk {
    pname = "glab-tui-crate";
    version = "0.8.4";
    bin = "glab-tui";
    url = "https://github.com/rcieri/glab-tui/releases/download/v0.8.4/glab-tui-linux-amd64.tar.gz";
    hash = "sha256-qrZdSBszPiMPV0qbZrKngWIIgpYHS+7/JTlROanMq1k=";
    description = "A terminal user interface for GitLab and GitHub";
    homepage = "https://github.com/rcieri/glab-tui";
  };

  gnomad = mk {
    pname = "gnomad";
    version = "0.4.1";
    url = "https://github.com/GooseRooster/gnomad/releases/download/v0.4.2/gnomad-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-oydOqN1zQYgpEBGOvHT1PtxDT1RZMKOIhoWnB4CX71U=";
    description = "A lightweight TUI for managing tinted color schemes in the G";
    homepage = "https://github.com/GooseRooster/gnomad";
  };

  gwm-cli = mk {
    pname = "gwm-cli";
    version = "1.9.0";
    bin = "gwm";
    subdir = "gwm-v1.9.0-x86_64-unknown-linux-gnu";
    url = "https://github.com/kbrdn1/gwm-cli/releases/download/v1.9.0/gwm-v1.9.0-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-lKAXsiconVzjOJoOEP743TO0nlFtgqmZIgvb4/Vp/RU=";
    description = "git worktree manager: TUI + CLI, native libgit2, per-repo bo";
    homepage = "https://github.com/kbrdn1/gwm-cli";
  };

  harper-ls = mk {
    pname = "harper-ls";
    version = "2.8.0";
    bin = "harper-cli";
    url = "https://github.com/automattic/harper/releases/download/v2.8.0/harper-cli-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-D699145jOuiVDIzOCRplQwa1Pc+keouGquU/jimpEQA=";
    description = "The language checker for developers";
    homepage = "https://github.com/automattic/harper";
  };

  hazelnut = mk {
    pname = "hazelnut";
    version = "0.3.0";
    url = "https://github.com/ricardodantas/hazelnut/releases/download/v0.3.0/hazelnut-0.3.0-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-3flaOa5skXZx7akMh4W4NIuITT9Ml/kKn8i4zGPqejE=";
    description = "A terminal-based automated file organizer inspired by Hazel";
    homepage = "https://github.com/ricardodantas/hazelnut";
  };

  hexapoda = mk {
    pname = "hexapoda";
    version = "1.0.0";
    url = "https://github.com/simonomi/hexapoda/releases/download/v1.0.0/hexapoda-linux-x86_64-v1.0.0.tar.gz";
    hash = "sha256-Zg7on7YjX53et4SuA9Z1Yp+RJQw8Wf4lNj7uX1rW3Kg=";
    description = "a colorful modal hex editor";
    homepage = "https://github.com/simonomi/hexapoda";
  };

  hf = mk {
    pname = "hf";
    version = "0.6.0";
    subdir = "hf-v0.6.0-x86_64-unknown-linux-musl";
    url = "https://github.com/sorairolake/hf/releases/download/v0.6.0/hf-v0.6.0-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-zrHEvAB8LEWIUqZshqsWwqPY0PhJs+NIz+WgrgI1hlE=";
    description = "Cross-platform hidden file library and utility";
    homepage = "https://github.com/sorairolake/hf";
  };

  hysp = mk {
    pname = "hysp";
    version = "0.1.2";
    subdir = "hysp-0.1.2";
    url = "https://github.com/pwnwriter/hysp/releases/download/v0.1.2/hysp-0.1.2-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-LgxDcwOzDbUd3o8ZjNcr6g+wknvbEdQjiZ5uSxPvMYE=";
    description = "📦 An independent package manager that every hacker deserves";
    homepage = "https://github.com/pwnwriter/hysp";
  };

  ibtop = mk {
    pname = "ibtop";
    version = "1.0.2";
    bare = true;
    url = "https://github.com/JannikSt/ibtop/releases/download/v1.0.2/ibtop-linux-amd64";
    hash = "sha256-i9IsJrmYN4J1LXW9+zoW7g7u8xj4t+iaAiFGU1jGp/k=";
    description = "Real-time terminal monitor for InfiniBand networks";
    homepage = "https://github.com/JannikSt/ibtop";
  };

  imdl = mk {
    pname = "imdl";
    version = "0.1.16";
    url = "https://github.com/casey/intermodal/releases/download/v0.1.16/imdl-v0.1.16-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-yeYOwSpqMut3HKvqneLWl+LEve1IIkD5lV905LlqEcE=";
    description = "📦 A 40' shipping container for the internet";
    homepage = "https://github.com/casey/intermodal";
  };

  inspect-cert-chain = mk {
    pname = "inspect-cert-chain";
    version = "0.0.35";
    url = "https://github.com/x52dev/inspect-cert-chain/releases/download/v0.0.35/inspect-cert-chain-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-YRm3oe2/DfoQEerOSpfliCvqbRZjNUa7tXCFA3OifBE=";
    description = "OpenSSL-like text output for debugging certificate chains";
    homepage = "https://github.com/x52dev/inspect-cert-chain";
  };

  iwes = mk {
    pname = "iwes";
    version = "0.19.1";
    url = "https://github.com/iwe-org/iwe/releases/download/iwe-v0.19.1/iwe-v0.19.1-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-tIA1oF1Y8/4YUFa3sweNe29rvujMRLKetAHyD+wEapc=";
    description = "IWE LSP server";
    homepage = "https://github.com/iwe-org/iwe";
  };

  jjj = mk {
    pname = "jjj";
    version = "0.4.1";
    subdir = "jjj-0.5.1-x86_64-unknown-linux-gnu";
    url = "https://github.com/doug/jjj/releases/download/v0.5.1/jjj-0.5.1-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-ikvkxCGecWhASgOsxh6NuzbPiFHVkmh+PnJG75lRRhk=";
    description = "Distributed project management and code review for Jujutsu";
    homepage = "https://github.com/doug/jjj";
  };

  jwt-ui = mk {
    pname = "jwt-ui";
    version = "1.3.0";
    bin = "jwtui";
    url = "https://github.com/jwt-rs/jwt-ui/releases/download/v1.3.0/jwtui-linux-musl.tar.gz";
    hash = "sha256-HbDJk3kTosOO3N2Uz7LhoAeWCXIyQO4uAlW9SgbpDJw=";
    description = "A Terminal UI for decoding/encoding JSON Web Tokens";
    homepage = "https://github.com/jwt-rs/jwt-ui";
  };

  kite-tui = mk {
    pname = "kite-tui";
    version = "0.1.0";
    subdir = "kite-tui-x86_64-unknown-linux-gnu";
    url = "https://github.com/KernelFreeze/kite-tui/releases/download/0.1.1/kite-tui-x86_64-unknown-linux-gnu.tar.xz";
    hash = "sha256-rTH5mUyxII8mkv/3paaNeoIndgBeN9ERXyq7Khnurqg=";
    description = "A terminal reader for Kagi News";
    homepage = "https://github.com/KernelFreeze/kite-tui";
  };

  krafna = mk {
    pname = "krafna";
    version = "0.5.6";
    url = "https://github.com/7sedam7/krafna/releases/download/v0.5.6/krafna-0.5.6-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-KZElNukBDPOoAAuQ//7klykikCXIw5KKqxfBnedv/xc=";
    description = "Krafna is a terminal-based alternative to Obsidian's Datavie";
    homepage = "https://github.com/7sedam7/krafna";
  };

  lawkit = mk {
    pname = "lawkit";
    version = "2.6.1";
    url = "https://github.com/kako-jun/lawkit/releases/download/v2.6.1/lawkit-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-RKQ1idN4m8uMh6fisxe0iYEOYX0VV2DS1HhwiuVmesw=";
    description = "Statistical law analysis CLI toolkit with international numb";
    homepage = "https://github.com/kako-jun/lawkit";
  };

  lazycelery = mk {
    pname = "lazycelery";
    version = "0.8.3";
    bin = "lazycelery-linux-x86_64";
    url = "https://github.com/Fguedes90/lazycelery/releases/download/v0.8.3/lazycelery-linux-x86_64.tar.gz";
    hash = "sha256-a+MrKm/ZJlam3ozJ/wPkHeYRA9CE3+1168hFXcq4wJ8=";
    description = "A terminal UI for monitoring and managing Celery workers and";
    homepage = "https://github.com/Fguedes90/lazycelery";
  };

  livediff = mk {
    pname = "livediff";
    version = "3.2.0";
    subdir = "livediff-v3.2.0-x86_64-unknown-linux-musl";
    url = "https://github.com/SoCkEt7/Livediff/releases/download/v3.2.0/livediff-v3.2.0-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-5rn6eUWVLEwWMG0WsHgl7lrzoFZcG3jQd1Bt3Td+kcY=";
    description = "Real-time file monitoring with beautiful diff visualization";
    homepage = "https://github.com/SoCkEt7/Livediff";
  };

  mairu = mk {
    pname = "mairu";
    version = "0.11.0";
    url = "https://github.com/sorah/mairu/releases/download/v0.11.0/mairu-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-fy416uhR2MnCPoUiGgD72Agi6K5UfYupSdVuE20Qwxs=";
    description = "on-memory AWS credentials agent and executor";
    homepage = "https://github.com/sorah/mairu";
  };

  mamediff = mk {
    pname = "mamediff";
    version = "0.5.1";
    bare = true;
    url = "https://github.com/sile/mamediff/releases/download/v0.5.1/mamediff-0.5.1.x86_64-unknown-linux-musl";
    hash = "sha256-jE2EwQK+SRl6jk+d3DeQtq+adviLzr0EKH6jtX2h3t0=";
    description = "A TUI editor for managing unstaged and staged Git diffs";
    homepage = "https://github.com/sile/mamediff";
  };

  mcdu = mk {
    pname = "mcdu";
    version = "0.3.5";
    url = "https://github.com/mikalv/mcdu/releases/download/v0.5.0/mcdu-linux-x86_64-musl.tar.gz";
    hash = "sha256-4aPRsFaaqAu7TpIPHkzWbLTrILxxJLdJ79+Tzd/Xl1w=";
    description = "A modern disk usage analyzer with a terminal UI, inspired by";
    homepage = "https://github.com/mikalv/mcdu";
  };

  mcp-cli = mk {
    pname = "mcp-cli";
    version = "0.3.0";
    bin = "mcp-probe";
    url = "https://github.com/conikeec/mcp-probe/releases/download/v0.3.0/mcp-probe-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-4m/MVoShschp8uHU8qwfB379x/PzdyhgsXFUtxVhVVw=";
    description = "Interactive CLI debugger and TUI for MCP servers";
    homepage = "https://github.com/conikeec/mcp-probe";
  };

  merman-cli = mk {
    pname = "merman-cli";
    version = "0.7.0";
    subdir = "merman-cli-x86_64-unknown-linux-gnu";
    url = "https://github.com/Latias94/merman/releases/download/v0.7.0/merman-cli-x86_64-unknown-linux-gnu.tar.xz";
    hash = "sha256-39wql4qISqWirVuFKF+1F1y0Negs+W76hgpVB0ngnZk=";
    description = "CLI to parse/layout/render Mermaid diagrams to SVG/PNG/JPG/P";
    homepage = "https://github.com/Latias94/merman";
  };

  moltbook-tui = mk {
    pname = "moltbook-tui";
    version = "1.0.0";
    bin = "moltbook";
    url = "https://github.com/terminaltrove/moltbook-tui/releases/download/v1.0.0/moltbook-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-x7CAdZ+Dt7IO8JeQ4oVNmVtNeP+CmvhRR6cFc7Fj6cE=";
    description = "A TUI client for moltbook, the social network for AI Agents";
    homepage = "https://github.com/terminaltrove/moltbook-tui";
  };

  mq-run = mk {
    pname = "mq-run";
    version = "0.8.3";
    bin = "mq";
    bare = true;
    url = "https://github.com/harehare/mq/releases/download/v0.8.3/mq-check-x86_64-unknown-linux-musl";
    hash = "sha256-ZDta0ePt93KxBD6Hvo6F2/0OM4uv/2AC2gF6lK+7Zmc=";
    description = "Command-line interface for mq Markdown processing tool";
    homepage = "https://github.com/harehare/mq";
  };

  needs = mk {
    pname = "needs";
    version = "0.6.0";
    bare = true;
    url = "https://github.com/NQMVD/needs/releases/download/main/needs-x86_64-unknown-linux-musl";
    hash = "sha256-E1H8nJY8Eym8Gfetqv6zvFONUrFFZyGZ7Aig6+VI0v0=";
    description = "Check if given bin(s) are available in the PATH";
    homepage = "https://github.com/NQMVD/needs";
  };

  netwatch-tui = mk {
    pname = "netwatch-tui";
    version = "0.29.2";
    bin = "netwatch-linux-x86_64-static";
    url = "https://github.com/matthart1983/netwatch/releases/download/v0.29.2/netwatch-linux-x86_64-static.tar.gz";
    hash = "sha256-ubrAGqIke50IkQXd8YTmQ3bZ4gPYvusPDB9lktWP5u4=";
    description = "Real-time network diagnostics in your terminal. One command,";
    homepage = "https://github.com/matthart1983/netwatch";
  };

  nu = mk {
    pname = "nu";
    version = "0.115.0";
    subdir = "nu-0.115.0-x86_64-unknown-linux-musl";
    url = "https://github.com/nushell/nushell/releases/download/0.115.0/nu-0.115.0-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-1RBWWwObU4SYZlLlef5EOHf8xN+G8WBy7V7cpkGtkvE=";
    description = "A new type of shell";
    homepage = "https://github.com/nushell/nushell";
  };

  nu-plugin-formats = mk {
    pname = "nu_plugin_formats";
    version = "0.115.0";
    subdir = "nu-0.115.0-x86_64-unknown-linux-musl";
    url = "https://github.com/nushell/nushell/releases/download/0.115.0/nu-0.115.0-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-1RBWWwObU4SYZlLlef5EOHf8xN+G8WBy7V7cpkGtkvE=";
    description = "An I/O plugin for a set of file formats for Nushell";
    homepage = "https://github.com/nushell/nushell";
  };

  nu-plugin-gstat = mk {
    pname = "nu_plugin_gstat";
    version = "0.115.0";
    subdir = "nu-0.115.0-x86_64-unknown-linux-musl";
    url = "https://github.com/nushell/nushell/releases/download/0.115.0/nu-0.115.0-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-1RBWWwObU4SYZlLlef5EOHf8xN+G8WBy7V7cpkGtkvE=";
    description = "A git status plugin for Nushell";
    homepage = "https://github.com/nushell/nushell";
  };

  nu-plugin-inc = mk {
    pname = "nu_plugin_inc";
    version = "0.115.0";
    subdir = "nu-0.115.0-x86_64-unknown-linux-musl";
    url = "https://github.com/nushell/nushell/releases/download/0.115.0/nu-0.115.0-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-1RBWWwObU4SYZlLlef5EOHf8xN+G8WBy7V7cpkGtkvE=";
    description = "A version incrementer plugin for Nushell";
    homepage = "https://github.com/nushell/nushell";
  };

  nu-plugin-polars = mk {
    pname = "nu_plugin_polars";
    version = "0.115.0";
    subdir = "nu-0.115.0-x86_64-unknown-linux-musl";
    url = "https://github.com/nushell/nushell/releases/download/0.115.0/nu-0.115.0-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-1RBWWwObU4SYZlLlef5EOHf8xN+G8WBy7V7cpkGtkvE=";
    description = "Nushell dataframe plugin commands based on polars";
    homepage = "https://github.com/nushell/nushell";
  };

  nu-plugin-query = mk {
    pname = "nu_plugin_query";
    version = "0.115.0";
    subdir = "nu-0.115.0-x86_64-unknown-linux-musl";
    url = "https://github.com/nushell/nushell/releases/download/0.115.0/nu-0.115.0-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-1RBWWwObU4SYZlLlef5EOHf8xN+G8WBy7V7cpkGtkvE=";
    description = "A Nushell plugin to query JSON, XML, and various web data";
    homepage = "https://github.com/nushell/nushell";
  };

  oeis-tui = mk {
    pname = "oeis-tui";
    version = "1.0.0";
    bin = "oeis";
    url = "https://github.com/hako/oeis-tui/releases/download/1.0.0/oeis-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-WziM/ZyNH2UcCxSNZBQGUgIs9MElgQuguc1zskFoAoc=";
    description = "A TUI and CLI for browsing the On-Line Encyclopedia of Integ";
    homepage = "https://github.com/hako/oeis-tui";
  };

  omp-manager = mk {
    pname = "omp-manager";
    version = "0.1.2";
    url = "https://github.com/marlocarlo/omp-manager/releases/download/v0.1.2/omp-manager-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-3yuBi86gfxUD8A2nut4Rmqf7BfceL6MvIeT4XvDxDng=";
    description = "A TUI manager for Oh My Posh - browse themes, install fonts,";
    homepage = "https://github.com/marlocarlo/omp-manager";
  };

  outside = mk {
    pname = "outside";
    version = "0.5.0";
    url = "https://github.com/BaconIsAVeg/outside/releases/download/v0.5.0/outside-0.5.0_Linux_x86_64.tar.gz";
    hash = "sha256-KFaMCaBbqbJUSR0SUx/ukjfn2MCB4BKBzwz67EPDiK0=";
    description = "A multi-purpose weather client for your terminal";
    homepage = "https://github.com/BaconIsAVeg/outside";
  };

  oyo = mk {
    pname = "oyo";
    version = "0.1.57";
    bin = "oy";
    url = "https://github.com/ahkohd/oyo/releases/download/v0.1.57/oy-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-dvkJXdGK/4pUC/3adzdGiikAsmx9l2u6oHE0HbAqqLM=";
    description = "CLI TUI for oyo - Step-through diff viewer";
    homepage = "https://github.com/ahkohd/oyo";
  };

  parallels = mk {
    pname = "parallels";
    version = "0.0.1";
    url = "https://github.com/skanehira/parallels/releases/download/v0.1.0/parallels_Linux_x86_64.tar.gz";
    hash = "sha256-TdTbLpAzjPe/NANf/2Q7TjLPqmzoszj0vdBfUphBud4=";
    description = "A TUI tool to run multiple commands in parallel and view the";
    homepage = "https://github.com/skanehira/parallels";
  };

  parqeye = mk {
    pname = "parqeye";
    version = "0.1.0";
    subdir = "parqeye-x86_64-unknown-linux-musl";
    url = "https://github.com/kaushiksrini/parqeye/releases/download/v0.1.0/parqeye-x86_64-unknown-linux-musl.tar.xz";
    hash = "sha256-gI0RhMNNyuGqoBOYi6GB7X+R3RKB1uEZdszKiNIyFJE=";
    description = "Parquet viewer for the command line";
    homepage = "https://github.com/kaushiksrini/parqeye";
  };



  perch = mk {
    pname = "perch";
    version = "0.3.4";
    url = "https://github.com/ricardodantas/perch/releases/download/v0.3.4/perch-0.3.4-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-UQSAI/JYefrE92hicsCQlz78DPpGRY40Yv/ZrFpTtwc=";
    description = "A beautiful terminal social client for Mastodon and Bluesky";
    homepage = "https://github.com/ricardodantas/perch";
  };

  pez = mk {
    pname = "pez";
    version = "0.5.1";
    subdir = "pez-x86_64-unknown-linux-musl";
    url = "https://github.com/tetzng/pez/releases/download/v0.5.1/pez-x86_64-unknown-linux-musl.tar.xz";
    hash = "sha256-BD+bJ6etF642mwtq2QMeS+Irpzp9iAArFlpimxfRAbw=";
    description = "A lockfile-backed plugin manager for fish";
    homepage = "https://github.com/tetzng/pez";
  };

  pgfmt = mk {
    pname = "pgfmt";
    version = "2.2.0";
    url = "https://github.com/gmr/pgfmt/releases/download/v2.2.0/pgfmt-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-9/LKEoaRXah4zVcujKKyrEtRUZ0lm5xdsEeCLEC2+lY=";
    description = "A PostgreSQL SQL formatter";
    homepage = "https://github.com/gmr/pgfmt";
  };

  pitchfork-cli = mk {
    pname = "pitchfork-cli";
    version = "2.22.0";
    bin = "pitchfork";
    url = "https://github.com/jdx/pitchfork/releases/download/v2.22.0/pitchfork-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-/WgqbvzNbTmlMhV8JsMGWFzeBzcP2W3cK/ppBCSKl38=";
    description = "Daemons with DX";
    homepage = "https://github.com/jdx/pitchfork";
  };

  punktf = mk {
    pname = "punktf";
    version = "3.1.2";
    subdir = "punktf-x86_64-unknown-linux-musl";
    url = "https://github.com/Shemnei/punktf/releases/download/v3.1.2/punktf-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-BDUlAzBLYychws3gkeRsjtStHqmFVWbbq5Lv6zhK+Dw=";
    description = "A cross-platform multi-target dotfiles manager";
    homepage = "https://github.com/Shemnei/punktf";
  };

  purple-ssh = mk {
    pname = "purple-ssh";
    version = "3.26.0";
    bin = "purple";
    url = "https://github.com/erickochen/purple/releases/download/v3.26.0/purple-3.26.0-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-IJiCJneuYAfsRKk1pXgrZktZJ2126L65ezw/dw3UH48=";
    description = "Free, open-source terminal SSH manager and SSH config editor";
    homepage = "https://github.com/erickochen/purple";
  };

  railwayapp = mk {
    pname = "railwayapp";
    version = "5.41.2";
    bin = "railway";
    url = "https://github.com/railwayapp/cli/releases/download/v5.43.1/railway-v5.43.1-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-zYPYeYpwoH+nnAciEMCey1xV7JO7L40vlRG86JtL1gU=";
    description = "Interact with Railway via CLI";
    homepage = "https://github.com/railwayapp/cli";
  };

  rucola-notes = mk {
    pname = "rucola-notes";
    version = "0.10.0";
    libs = [ prev.openssl prev.zlib ];
    bin = "rucola";
    subdir = "rucola-notes-x86_64-unknown-linux-gnu";
    url = "https://github.com/Linus-Mussmaecher/rucola/releases/download/v0.10.0/rucola-notes-x86_64-unknown-linux-gnu.tar.xz";
    hash = "sha256-4H9rtyL5nh86GldHv269Rme6B9ckjlsxO+7FT93PfO0=";
    description = "Terminal-based markdown note manager";
    homepage = "https://github.com/Linus-Mussmaecher/rucola";
  };

  rusk-task = mk {
    pname = "rusk-task";
    version = "0.1.2";
    bin = "rusk";
    url = "https://github.com/gw31415/rusk-task/releases/download/v0.1.2/rusk-v0.1.2-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-VznzlU9mCjXHEI3A6NWXZR3r8mQfdBFK+r8HuMWRCNc=";
    description = "An asynchronous task runner in Rust, aiming to be a “simpler";
    homepage = "https://github.com/gw31415/rusk-task";
  };

  rusticon = mk {
    pname = "rusticon";
    version = "0.2.3";
    url = "https://github.com/ronilan/rusticon/releases/download/v0.3.0/rusticon-terminal-linux.zip";
    hash = "sha256-FNzIrqXiOYz0/xNukLzTSPWgwruZdq97j5tzL66JInY=";
    description = "Rusticon is a mouse driven SVG favicon editor for your termi";
    homepage = "https://github.com/ronilan/rusticon";
  };

  rustnet-monitor = mk {
    pname = "rustnet-monitor";
    version = "1.5.0";
    bin = "rustnet";
    subdir = "rustnet-v1.6.0-x86_64-linux-android-musl";
    url = "https://github.com/domcyrus/rustnet/releases/download/v1.6.0/rustnet-v1.6.0-x86_64-linux-android-musl.tar.gz";
    hash = "sha256-FA2mcEIDVnx5KJPg+f4g8R7/OsRws2roS20moUJTOCk=";
    description = "A cross-platform network monitoring terminal UI tool built w";
    homepage = "https://github.com/domcyrus/rustnet";
  };

  rustormy = mk {
    pname = "rustormy";
    version = "0.5.2";
    subdir = "rustormy-v0.5.2-Linux";
    url = "https://github.com/Tairesh/rustormy/releases/download/v0.5.2/rustormy-v0.5.2-Linux.tar.gz";
    hash = "sha256-ZGqrhkkDahvSUykvihnpx649NSi26hPRqRtLfSyEfZw=";
    description = "Minimal neofetch-like weather CLI";
    homepage = "https://github.com/Tairesh/rustormy";
  };

  rvpm = mk {
    pname = "rvpm";
    version = "3.44.0";
    url = "https://github.com/yukimemi/rvpm/releases/download/v3.46.0/rvpm-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-ngqGLt89yBLBGIeQndAvfgLBBrQ1qjz9ato5SM+znPo=";
    description = "Fast Neovim plugin manager with pre-compiled loader and merg";
    homepage = "https://github.com/yukimemi/rvpm";
  };

  scope-monitor = mk {
    pname = "scope-monitor";
    version = "0.6.0";
    libs = [ prev.systemdLibs ];
    bin = "scope";
    subdir = "scope-monitor-x86_64-unknown-linux-gnu";
    url = "https://github.com/matheuswhite/scope-rs/releases/download/v0.6.0/scope-monitor-x86_64-unknown-linux-gnu.tar.xz";
    hash = "sha256-Oo06KsGitXcodbg1gM0Syemk++PvPgrvMmbSXVjU4Ks=";
    description = "A multi-platform serial monitor with user-extensible feature";
    homepage = "https://github.com/matheuswhite/scope-rs";
  };

  scraps = mk {
    pname = "scraps";
    version = "1.0.1";
    url = "https://github.com/boykush/scraps/releases/download/v1.2.0/scraps-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-VRAxqn8mAIDKY4PY1TI0CHXJMLzCK2K5eLnLJOOws0w=";
    description = "Scraps is a portable CLI knowledge hub for managing intercon";
    homepage = "https://github.com/boykush/scraps";
  };

  seednaut = mk {
    pname = "seednaut";
    version = "0.1.1";
    subdir = "seednaut-v0.1.1-x86_64-unknown-linux-musl";
    url = "https://github.com/Baltram/seednaut/releases/download/v0.1.1/seednaut-v0.1.1-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-VInTCHtDK/wQs5NaCPP3PJYOgKRYRmg5BraDve91Kug=";
    description = "A command-line utility for inspecting, verifying, and extrac";
    homepage = "https://github.com/Baltram/seednaut";
  };

  sharedserver = mk {
    pname = "sharedserver";
    version = "0.8.2";
    subdir = "sharedserver-x86_64-unknown-linux-gnu";
    url = "https://github.com/georgeharker/sharedserver/releases/download/v0.8.2/sharedserver-x86_64-unknown-linux-gnu.tar.xz";
    hash = "sha256-AWtxv8LUP4WaUVFxg88HPs6SRq/3lye5NTVPV8pNK1c=";
    description = "A lightweight CLI tool and library for managing shared serve";
    homepage = "https://github.com/georgeharker/sharedserver";
  };

  siggy = mk {
    pname = "siggy";
    version = "1.14.2";
    url = "https://github.com/johnsideserf/siggy/releases/download/v1.14.2/siggy-v1.14.2-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-DuVtOgdwMlh9PW2i3DTcKBodcsubkDsOCgtCKFAU2h0=";
    description = "Terminal-based Signal messenger client with vim keybindings";
    homepage = "https://github.com/johnsideserf/siggy";
  };

  sigrs = mk {
    pname = "sigrs";
    version = "0.3.0";
    bin = "sig";
    subdir = "sigrs-x86_64-unknown-linux-musl";
    url = "https://github.com/ynqa/sig/releases/download/v0.3.0/sigrs-x86_64-unknown-linux-musl.tar.xz";
    hash = "sha256-i7/tDkpZf+F+6QyHxjqMptp5Aqyz7JrFmllpdftVTeA=";
    description = "Interactive grep (for streaming)";
    homepage = "https://github.com/ynqa/sig";
  };

  sigye = mk {
    pname = "sigye";
    version = "0.6.0";
    url = "https://github.com/am2rican5/sigye/releases/download/v0.6.0/sigye-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-SEcengWK8U+CyIye71MzSD7Xg4hkCbdIF1hjZgvVh9A=";
    description = "A beautiful terminal clock with ASCII art fonts";
    homepage = "https://github.com/am2rican5/sigye";
  };

  similarity-ts = mk {
    pname = "similarity-ts";
    version = "0.5.0";
    subdir = "similarity-v0.5.0-x86_64-unknown-linux-gnu";
    url = "https://github.com/mizchi/similarity/releases/download/v0.5.0/similarity-v0.5.0-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-Kv2mIBtq+x7jbBzlG5WlOOyZMQx59mGQVTbZF0cKQGo=";
    description = "CLI tool for detecting code duplication in TypeScript/JavaSc";
    homepage = "https://github.com/mizchi/similarity";
  };

  soundscope = mk {
    pname = "soundscope";
    version = "1.9.2";
    libs = [ prev.alsa-lib ];
    url = "https://github.com/bananaofhappiness/soundscope/releases/download/v1.9.2/soundscope-Linux-gnu-x86_64.tar.gz";
    hash = "sha256-zWnvwFiIJqi/LfoCZL5qESbXiUg7SisRMCJH9QfrBxc=";
    description = "A command-line tool for analyzing audio files and real-time";
    homepage = "https://github.com/bananaofhappiness/soundscope";
  };

  spectatui = mk {
    pname = "spectatui";
    version = "1.0.1";
    subdir = "spectatui-v1.0.1-x86_64-unknown-linux-gnu";
    url = "https://github.com/tinesoft/spectatui/releases/download/v1.0.1/spectatui-v1.0.1-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-2E3NXUCeGecBC/tEtaXfAlX/1WLZgM4YVvwPHsvTkM8=";
    description = "TUI dashboard for GitHub Spec-Kit";
    homepage = "https://github.com/tinesoft/spectatui";
  };

  splashboard = mk {
    pname = "splashboard";
    version = "2.10.0";
    url = "https://github.com/unhappychoice/splashboard/releases/download/v2.10.0/splashboard-v2.10.0-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-nRGL09BykmcGqQkaXJgDzs+JYaWMGAFIbWLyk+aGeuQ=";
    description = "A customizable terminal splash screen with plugin-based data";
    homepage = "https://github.com/unhappychoice/splashboard";
  };

  ssh-list = mk {
    pname = "ssh-list";
    version = "1.5.1";
    url = "https://github.com/akinoiro/ssh-list/releases/download/v1.5.1/ssh-list-v1.5.1-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-xQcKPDUCPBZY5W4LelfjOLsnuDAt3LBr8sbxzlgcQ8g=";
    description = "SSH connection manager with a TUI interface";
    homepage = "https://github.com/akinoiro/ssh-list";
  };

  strace-tui = mk {
    pname = "strace-tui";
    version = "1.0.1";
    url = "https://github.com/Rodrigodd/strace-tui/releases/download/v1.0.1/strace-tui-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-t1eeN6DgHF6ndYQpL3ryhLHA4L8ZmYFmWCgjfw8npCw=";
    description = "A terminal user interface (TUI) for visualizing and explori";
    homepage = "https://github.com/Rodrigodd/strace-tui";
  };

  superseedr = mk {
    pname = "superseedr";
    version = "1.0.13";
    libs = [ prev.openssl ];
    subdir = "superseedr-private_v1.0.13_linux-amd64";
    url = "https://github.com/Jagalite/superseedr/releases/download/v1.0.13/superseedr-private_v1.0.13_linux-amd64.tar.gz";
    hash = "sha256-vIzkZbDs3f4sLR+P/UcHI/7IZoMouquG3aXnggOokyc=";
    description = "A BitTorrent Client in your Terminal";
    homepage = "https://github.com/Jagalite/superseedr";
  };

  swaptop = mk {
    pname = "swaptop";
    version = "1.0.6";
    subdir = ".";
    url = "https://github.com/luis-ota/swaptop/releases/download/v1.0.6/swaptop-v1.0.6-linux-amd64.tar.gz";
    hash = "sha256-b38iCL4rYeG6CmpSo/ZvVpgHQRjAn2PDepBNh1eguvo=";
    description = "A terminal user interface tool to monitor swap usage on Linu";
    homepage = "https://github.com/luis-ota/swaptop";
  };

  tatuin = mk {
    pname = "tatuin";
    version = "0.26.0";
    url = "https://github.com/panter-dsd/tatuin/releases/download/v0.26.0/tatuin-Linux-musl-x86_64.tar.gz";
    hash = "sha256-KBIXBo3roQlJj9Z0YeL2EETWfWrum1zNiHBbfLIzz10=";
    description = "Task Aggregator TUI for N providers";
    homepage = "https://github.com/panter-dsd/tatuin";
  };

  taws = mk {
    pname = "taws";
    version = "1.2.1";
    url = "https://github.com/huseyinbabal/taws/releases/download/v1.3.0-rc.8/taws-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-AhyTWtGaA4zFxZ9DbLK0gP+fmBJmyDCtIMyA1YJQ+LU=";
    description = "Terminal UI for AWS - navigate, observe, and manage AWS reso";
    homepage = "https://github.com/huseyinbabal/taws";
  };

  tod = mk {
    pname = "tod";
    version = "0.17.1";
    url = "https://github.com/tod-org/tod/releases/download/v0.18.0/tod-0.18.0-linux-amd64.tar.gz";
    hash = "sha256-ucDg+kxTlUeSwg3adHYBh4NGeT4FCdiJIaTr2u1rqUE=";
    description = "An unofficial Todoist command-line client";
    homepage = "https://github.com/tod-org/tod";
  };

  tredis = mk {
    pname = "tredis";
    version = "1.2.0";
    url = "https://github.com/huseyinbabal/tredis/releases/download/v1.2.0/tredis-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-HddBYvwji06t5UMSJZOQpBhLgnYnuaYkgU24xODVkUM=";
    description = "Terminal UI for Redis - A modern TUI for managing Redis serv";
    homepage = "https://github.com/huseyinbabal/tredis";
  };

  turm = mk {
    pname = "turm";
    version = "0.14.0";
    url = "https://github.com/karimknaebel/turm/releases/download/v0.14.0/turm-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-cht6fIgeQHNMi6zejXPnufzKceQbG8fEL0tsm5Dkh0w=";
    description = "A TUI for the Slurm Workload Manager";
    homepage = "https://github.com/karimknaebel/turm";
  };

  uuinfo = mk {
    pname = "uuinfo";
    version = "0.7.5";
    url = "https://github.com/racum/uuinfo/releases/download/v0.7.5/uuinfo-linux-x86_64.tar.gz";
    hash = "sha256-tIN9vktJ/AOLjKs/fRXQqAhp17XZfuwTHsRihRGLBmo=";
    description = "Tool to debug unique identifiers (UUID, ULID, Snowflake, etc";
    homepage = "https://github.com/racum/uuinfo";
  };

  vibe-ticket = mk {
    pname = "vibe-ticket";
    version = "0.4.0";
    url = "https://github.com/nwiizo/vibe-ticket/releases/download/v0.4.0/vibe-ticket-linux-amd64-musl.tar.gz";
    hash = "sha256-Kf7H8NQ5NVGcuH8j+U/kMy1RC8GnTU47mJ9cQf96tmw=";
    description = "A high-performance ticket management system for Vibe Coding";
    homepage = "https://github.com/nwiizo/vibe-ticket";
  };

  vortix = mk {
    pname = "vortix";
    version = "0.4.3";
    subdir = "vortix-x86_64-unknown-linux-musl";
    url = "https://github.com/Harry-kp/vortix/releases/download/v0.4.3/vortix-x86_64-unknown-linux-musl.tar.xz";
    hash = "sha256-MadZG75aWKcur0PDjPCBhji4U2YTSkjswriG1xwjdF0=";
    description = "Terminal UI for WireGuard and OpenVPN with real-time telemet";
    homepage = "https://github.com/Harry-kp/vortix";
  };

  vscli = mk {
    pname = "vscli";
    version = "1.3.3";
    subdir = "vscli-x86_64-unknown-linux-musl";
    url = "https://github.com/michidk/vscli/releases/download/v1.3.3/vscli-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-zMeFNWDxE2B3EyOYhkZr8czlA6pDn5ZYLflgw6A8ZfA=";
    description = "A CLI tool to launch vscode projects, which supports devcont";
    homepage = "https://github.com/michidk/vscli";
  };

  wireman = mk {
    pname = "wireman";
    version = "0.3.8";
    subdir = "wireman-0.3.8-x86_64-unknown-linux-gnu";
    url = "https://github.com/preiter93/wireman/releases/download/v0.3.8/wireman-0.3.8-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-SB/tCtCvTXoyiBe8094Mlvspd2Nh95zW50QBeeGM6hI=";
    description = "A TUI based gRPC client";
    homepage = "https://github.com/preiter93/wireman";
  };

  wisu = mk {
    pname = "wisu";
    version = "0.1.7";
    subdir = ".";
    url = "https://github.com/sh1zen/wisu/releases/download/v0.1.6/wisu-linux-x86_64.tar.gz";
    hash = "sha256-ALRfZ/BeFayfMhQrBei0wnCJydXqyIHubyZykmj6rnI=";
    description = "A fast minimalist directory tree viewer, written in Rust";
    homepage = "https://github.com/sh1zen/wisu";
  };

  work-tuimer = mk {
    pname = "work-tuimer";
    version = "0.6.0";
    bare = true;
    url = "https://github.com/Kamyil/work-tuimer/releases/download/v0.6.0/work-tuimer-linux-x86_64";
    hash = "sha256-5ENmxKOIoRYRlTMaWGbQRu7pl9SpZ65hZso1q352QdU=";
    description = "Simple, keyboard-driven TUI for time-tracking that allows yo";
    homepage = "https://github.com/Kamyil/work-tuimer";
  };

  xsv = mk {
    pname = "xsv";
    version = "0.13.0";
    url = "https://github.com/BurntSushi/xsv/releases/download/0.13.0/xsv-0.13.0-x86_64-unknown-linux-musl.tar.gz";
    hash = "sha256-02sb4PAI1ll8JDfnZPvnIOt1V/iYDgsDynCeECC1xSs=";
    description = "A high performance CSV command line toolkit";
    homepage = "https://github.com/BurntSushi/xsv";
  };

}
