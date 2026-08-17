# nixpkgs ships PowerShell 7.6.4 while aqua was installing 7.6.5. Migrating the
# package without this overlay would move the shell one patch backwards.
#
# Overriding is cheap here: the nixpkgs derivation is a repackage of the
# upstream release tarball, so pinning a newer version only swaps `src`.
# Nothing is compiled.
#
# Remove this file once nixpkgs reaches 7.6.5 or later. Kept past that point it
# pins the version backwards instead of forwards.
_: prev: {
  powershell = prev.powershell.overrideAttrs (_: rec {
    version = "7.6.5";
    src = prev.fetchurl {
      url = "https://github.com/PowerShell/PowerShell/releases/download/v${version}/powershell-${version}-linux-x64.tar.gz";
      hash = "sha256-s0qzsZrKwdPU0NPP2wKs9i9Fewtqli/wCBMgM/dWaEQ=";
    };
  });
}
