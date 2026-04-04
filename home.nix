{ ... }:
{
  imports = [
    ./packages
    ./files.nix
    ./env.nix
    ./programs.nix
  ];

  home.username = "mimikun";
  home.homeDirectory = "/home/mimikun";

  # NOTE: DO NOT CHANGE IT!!!
  home.stateVersion = "24.05";
}
