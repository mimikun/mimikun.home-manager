{ ... }:
{
  programs.home-manager.enable = true;

  # `programs.omp.settings` renders ~/.omp/agent/config.yml on every switch, so
  # the whole file has to be declared here: keys left out are dropped, not kept.
  # The module installs a writable copy (mode 600) rather than a store symlink,
  # because OMP locks and rewrites the file at runtime. Runtime edits made via
  # `/settings` or `omp config set` are therefore overwritten on the next switch
  # — that is the point, but it also means transient policy (a tool-approval
  # gate while sharing a session over `/collab`, say) belongs in a `--config`
  # overlay instead of here.
  #
  # Never put credentials in here. The repo is public, and the rendered YAML
  # also lands world-readable in /nix/store.
  programs.omp = {
    enable = true;
    settings = {
      setupVersion = 2;
      theme = {
        dark = "dark-tokyo-night";
        light = "light-tokyo-night";
      };
      symbolPreset = "nerd";
      colorBlindMode = false;
      composer.shape = "claude";
      statusLine = {
        preset = "nerd";
        separator = "powerline-thin";
        contextLine = "embedded";
        transparent = false;
        compactThinkingLevel = false;
      };
      display.showTokenUsage = true;
      tui.imeSafeCursor = true;
      defaultThinkingLevel = "medium";
      modelRoleStorage = "global";
      # Declared, so `/model` changes revert on the next switch.
      modelRoles.default = "anthropic/claude-opus-5";
    };
  };
}
