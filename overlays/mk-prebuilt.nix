# Shared builder for the prebuilt-* overlays. This file is not an overlay
# itself and is not listed in default.nix; the overlays import it and apply it
# to their own `prev`.
#
# Nothing here is built from source. Each entry fetches one release asset and
# copies a binary out of it, so a version bump is a version string and a hash:
#
#     nix store prefetch-file --hash-type sha256 <asset url>
#
# `meta.license` is deliberately absent. These derivations are local, and
# stating a license without checking each project would be a guess.
prev:

# url shapes differ per project, so each entry spells its own out rather than
# deriving it from a template that would only be true for some of them.
{
  pname,
  version,
  url,
  hash,
  bin ? pname,
  # subdirectory inside the archive holding the binary; null means the archive
  # is flat
  subdir ? null,
  # the asset is the binary itself, not an archive
  bare ? false,
  description,
  homepage,
}:
let
  inherit (prev) lib;
in
prev.stdenvNoCC.mkDerivation (
  {
    inherit pname version;

    src = prev.fetchurl { inherit url hash; };

    # Statically linked assets give autoPatchelfHook nothing to do; the
    # dynamically linked ones need it.
    nativeBuildInputs =
      [ prev.autoPatchelfHook ] ++ lib.optional (lib.hasSuffix ".zip" url) prev.unzip;
    buildInputs = [ prev.stdenv.cc.cc.lib ];

    installPhase = ''
      runHook preInstall
      install -Dm755 ${if bare then "$src" else bin} $out/bin/${bin}
      runHook postInstall
    '';

    meta = {
      inherit description homepage;
      mainProgram = bin;
      platforms = [ "x86_64-linux" ];
    };
  }
  // (
    if bare then
      { dontUnpack = true; }
    else
      { sourceRoot = if subdir == null then "." else subdir; }
  )
)
