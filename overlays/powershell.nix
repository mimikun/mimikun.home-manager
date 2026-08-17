# PowerShell, in the two forms aqua used to provide.
#
# nixpkgs has one PowerShell attribute, pinned to the stable line, and no
# preview at all. aqua carried both: stable as `pwsh`, and the preview build
# as `pwsh-unstable` via its command_aliases feature. This overlay reproduces
# that arrangement.
#
# Overriding is cheap: the nixpkgs derivation is a repackage of the upstream
# release tarball, so each version only swaps `src`. Nothing is compiled.
#
# `powershell` — pinned forward to 7.6.5, because nixpkgs ships 7.6.4 and
# migrating off aqua should not move the shell a patch backwards. Delete this
# pin once nixpkgs reaches 7.6.5 or later; kept past that point it pins
# backwards instead of forwards.
#
# `pwsh-unstable` — the preview build. It cannot simply be added to
# home.packages alongside the stable one: both derivations install `bin/pwsh`
# and a `share/powershell` tree, which collide when the profile is built. So
# the preview package itself stays out of the profile, and only a one-binary
# wrapper around it goes in. That wrapper is what carries the renamed command.
#
# Bumping a version means changing the version string and its hash:
#     nix store prefetch-file --hash-type sha256 <tarball url>
final: prev:
let
  tarball =
    v:
    prev.fetchurl {
      url = "https://github.com/PowerShell/PowerShell/releases/download/v${v}/powershell-${v}-linux-x64.tar.gz";
      hash =
        {
          "7.6.5" = "sha256-s0qzsZrKwdPU0NPP2wKs9i9Fewtqli/wCBMgM/dWaEQ=";
          "7.7.0-preview.3" = "sha256-6973/ZyTMaXGhiByMumHlJNo4/8gSBc7JUnqs33BtM4=";
        }
        .${v};
    };
in
{
  powershell = prev.powershell.overrideAttrs (_: {
    version = "7.6.5";
    src = tarball "7.6.5";
  });

  # The full preview package. Not meant for home.packages -- see the header.
  powershell-preview = prev.powershell.overrideAttrs (_: {
    pname = "powershell-preview";
    version = "7.7.0-preview.3";
    src = tarball "7.7.0-preview.3";
  });

  # What actually goes in the profile: `pwsh-unstable` and nothing else, so it
  # cannot collide with the stable package.
  pwsh-unstable = prev.runCommand "pwsh-unstable-7.7.0-preview.3" {
    meta = {
      description = "PowerShell preview build, exposed as pwsh-unstable";
      inherit (prev.powershell.meta) homepage license platforms;
      mainProgram = "pwsh-unstable";
    };
  } ''
    mkdir -p $out/bin
    ln -s ${final.powershell-preview}/bin/pwsh $out/bin/pwsh-unstable
  '';
}
