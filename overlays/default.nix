# Overlays applied to nixpkgs, in order. Each file is a standalone overlay
# function and carries the reason it exists plus the condition for deleting it.
[
  (import ./powershell.nix)
]
