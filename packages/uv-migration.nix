{ pkgs, ... }:
{
  # Tools moved off `uv tool install`, first batch.
  #
  # Same two checks the gup migration settled on, run against the flake's
  # nixpkgs: the attribute is the same project uv installed from PyPI, and the
  # nixpkgs version equals the installed one, so nothing moves in either
  # direction.
  #
  # One check is new here and does the real work. A uv tool can install several
  # commands, so matching the package is not enough - the nixpkgs derivation
  # has to ship every command uv was providing. Each bin directory was listed
  # and compared: csvkit's fourteen csv* commands, trash-cli's six trash*,
  # vectorcode's three, sqlit-tui's two, asciidoc's a2x alongside asciidoc.
  # All present.
  #
  # trash-cli is left on uv for a different reason, and only the profile build
  # found it. trashy is already declared here and both ship a `trash` command,
  # so buildEnv refuses the pair over a colliding completion file. Today
  # ~/.nix-profile wins the PATH, which means trashy already owns `trash` while
  # trash-cli's trash-put, trash-list and the rest stay reachable from
  # ~/.local/bin. Moving it would force a choice about which tool owns the name
  # rather than leave things as they are, so it stays where it is.
  #
  # rsyncy was dropped over exactly this. nixpkgs is one version ahead, so it
  # passed the version rule, but it ships only rsyncy while uv also provides
  # rsyncy-stat. Moving it would have taken a command away.
  #
  # What changes by moving: `uv tool upgrade` keeps each tool on the Python it
  # was installed with, and nixpkgs pins the interpreter its own way. These are
  # applications rather than libraries, so nothing here imports them, but it is
  # a real difference from the Go batches, where a static binary moved as-is.
  home.packages = with pkgs; [
    asciidoc         # Text-based document generation system
    bagels           # Powerful expense tracker that lives in your terminal
    castero          # TUI podcast client for the terminal
    csvkit           # Suite of command-line tools for converting to and working with CSV
    ddgr             # Search DuckDuckGo from the terminal
    git-filter-repo  # Quickly rewrite git repository history
    gita             # Command-line tool to manage multiple git repos
    gitingest        # Replace 'hub' with 'ingest' in any github url to get a prompt-friendly extract of a codebase
    glances          # Cross-platform curses-based monitoring tool
    jc               # This tool serializes the output of popular command line tools and filetypes to structured JSON output
    jiratui          # A Textual User Interface for interacting with Atlassian Jira from your shell
    markitdown       # Python tool for converting files and office documents to Markdown
    mdformat         # CommonMark compliant Markdown formatter
    pgcli            # Command-line interface for PostgreSQL
    posting          # Modern API client that lives in your terminal
    pur              # Python library for update and track the requirements
    smassh           # TUI based typing test application inspired by MonkeyType
    snowmachine      # Python script that will make your terminal snow
    sqlit-tui        # Lightweight TUI for SQL Server, PostgreSQL, MySQL, SQLite, and more
    toolong          # Terminal application to view, tail, merge, and search log files (plus JSONL)
    typeinc          # Terminal tool to test your typing speed with various difficulty levels
    vectorcode       # Code repository indexing tool to supercharge your LLM experience
    wtfis            # Passive hostname, domain and IP lookup tool for non-robots
  ];
}
