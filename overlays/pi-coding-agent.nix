# pi-coding-agent is not in nixpkgs yet. Keep the upstream release binary in
# an overlay until nixpkgs has an equivalent package.
final: prev:
{
  pi-coding-agent = prev.stdenvNoCC.mkDerivation {
    pname = "pi-coding-agent";
    version = "0.84.2";

    src = prev.fetchurl {
      url = "https://github.com/earendil-works/pi/releases/download/v0.84.2/pi-linux-x64.tar.gz";
      hash = "sha256-kG++eH/SJcSsYk/n69Wx1Vpg4PXH71F5XSMVZPnuHBM=";
    };

    installPhase = ''
      install -Dm755 pi $out/bin/pi
      mkdir -p $out/share/pi
      cp -r theme docs examples $out/share/pi/
    '';

    meta = {
      description = "Coding agent CLI with read, bash, edit, and write tools";
      homepage = "https://pi.dev";
      mainProgram = "pi";
      platforms = [ "x86_64-linux" ];
    };
  };
}
