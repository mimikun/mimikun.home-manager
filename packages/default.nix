{ ... }:
{
  imports = [
    ./cli.nix
    ./dev-tools.nix
    ./gup-migration.nix
    ./uv-migration.nix
    ./prebuilt-rust.nix
  ];
}
