# mimikun's home-manager (standalone install, with flake)

Home Manager configuration for `mimikun` on `x86_64-linux`, tracking
`nixos-unstable`. Standalone install, not the NixOS module.

```sh
home-manager switch --flake .#mimikun
```

## Goal

Migrate off [aqua](https://aquaproj.github.io/). aqua needs a GitHub PAT, and
that is the reason for moving. It is not finished: `~/.local/share/aqua/bin`
still holds shims, and aqua stays until the last of them is gone.

Tools nixpkgs has no attribute for are packaged from their upstream release
binaries under `overlays/prebuilt-*.nix` rather than built from source.

## Machines

Only ever applied on `Azusa`. `Wakamo` and `Izuna` are untested rather than
known-broken: nothing in this repository is host-specific, so the config may
well work there, but nobody has run it to find out.

See `CLAUDE.md` for the layout and the rules that apply when editing this repo.
