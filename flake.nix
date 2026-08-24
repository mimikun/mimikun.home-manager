{
  description = "Home Manager configuration of mimikun";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixpkgs has no attribute for ghcitty, but upstream ships a flake that
    # builds it. Tracking that is less to maintain than a local
    # buildRustPackage, and `nix flake update` bumps it. Drop this input if
    # nixpkgs ever packages ghcitty.
    ghcitty = {
      url = "github:mattlianje/ghcitty";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # OMP is a batteries-included Pi fork with a Home Manager module.
    omp.url = "github:can1357/oh-my-pi";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ghcitty,
      omp,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        # The inline overlay carries packages that come from a flake input, so
        # they can be listed in packages/*.nix by name like anything else.
        # Files under ./overlays cannot do this: they only see nixpkgs.
        overlays = (import ./overlays) ++ [
          (final: prev: {
            # One test writes a symlink under $HOME, which the build sandbox
            # sets to an unwritable path. Giving the check phase a temporary
            # HOME keeps all 159 tests running rather than skipping that one.
            ghcitty = ghcitty.packages.${system}.default.overrideAttrs (old: {
              preCheck = (old.preCheck or "") + ''
                export HOME=$(mktemp -d)
              '';
            });
          })
        ];
      };
    in
    {
      homeConfigurations."mimikun" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          omp.homeManagerModules.default
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
