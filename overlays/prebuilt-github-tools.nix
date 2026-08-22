# Tools nixpkgs does not package, installed from their upstream release
# binaries -- the same thing aqua was doing, expressed as derivations.
#
# The builder lives in ./mk-prebuilt.nix, shared with the other prebuilt-*
# overlay. Nothing is built from source.
#
# Moving these off aqua gave up renovate's automatic version bumps. The trade
# was deliberate -- as long as one tool needs aqua, aqua needs a GitHub PAT,
# which is the reason for the migration in the first place -- and bumping is
# being handled separately now.
#
# Three of these collide with existing nixpkgs attributes that ship unrelated
# software: `qq` is Tencent QQ, `gama` is GNU Gama, `pingu` is a different
# pingu. They are added under prefixed attribute names rather than overriding
# the originals, so nothing else in nixpkgs silently gets a different package.
# The commands they install keep their usual names.
final: prev:
let
  mk = import ./mk-prebuilt.nix prev;
in
{
  # aquaproj/registry-tool. The binary was renamed from aqua-registry to argd;
  # the aqua-registry shim still sitting in ~/.local/share/aqua/bin is a
  # leftover from before v0.3.7-0 and is not reproduced here.
  aqua-registry-tool = mk {
    pname = "aqua-registry-tool";
    version = "0.5.7";
    bin = "argd";
    url = "https://github.com/aquaproj/registry-tool/releases/download/v0.5.7/argd_linux_amd64.tar.gz";
    hash = "sha256-m9ugAhRa2ta4/M+ka6Hdx6MPCk8pK4dDHe9d+6pMJoU=";
    description = "CLI to develop an aqua registry";
    homepage = "https://github.com/aquaproj/registry-tool";
  };

  # The musl asset is used rather than the gnu one: it is statically linked, so
  # there is no interpreter to patch.
  reminder-lint = mk {
    pname = "reminder-lint";
    version = "0.2.1";
    subdir = "reminder-lint-x86_64-unknown-linux-musl";
    url = "https://github.com/CyberAgent/reminder-lint/releases/download/0.2.1/reminder-lint-x86_64-unknown-linux-musl.tar.xz";
    hash = "sha256-Vm5eMColYq6ohCB4HLPGJZWQmEv2R5aFQlrWOuLNgfY=";
    description = "Linter for reminder comments in source code";
    homepage = "https://github.com/CyberAgent/reminder-lint";
  };

  dagu = mk {
    pname = "dagu";
    version = "2.14.0";
    url = "https://github.com/dagu-org/dagu/releases/download/v2.14.0/dagu_2.14.0_linux_amd64.tar.gz";
    hash = "sha256-ypAgYPCK1p9+aL5TsMb4FGzvmuPzVYUp0x13PbIC0A0=";
    description = "Workflow engine with no external dependencies";
    homepage = "https://github.com/dagu-org/dagu";
  };

  godap = mk {
    pname = "godap";
    version = "2.12.0";
    url = "https://github.com/Macmod/godap/releases/download/v2.12.0/godap-v2.12.0-linux-amd64.tar.gz";
    hash = "sha256-UXrj72BxNhpQnj6jD9Fc/mnn3/5CNTRxKWp6KOrxPZc=";
    description = "Terminal UI for browsing and editing LDAP directories";
    homepage = "https://github.com/Macmod/godap";
  };

  pkgx = mk {
    pname = "pkgx";
    version = "2.11.0";
    url = "https://github.com/pkgxdev/pkgx/releases/download/v2.11.0/pkgx-2.11.0+linux+x86-64.tar.xz";
    hash = "sha256-ebxObdpLKKC6PR095t8/0H9GNMiZEcvoDzbLjG3fW1U=";
    description = "Runs anything, fetching it on demand";
    homepage = "https://pkgx.sh";
  };

  cmdx = mk {
    pname = "cmdx";
    version = "2.0.2";
    url = "https://github.com/suzuki-shunsuke/cmdx/releases/download/v2.0.2/cmdx_linux_amd64.tar.gz";
    hash = "sha256-QLx7X0ciEbIsR4bVX2hZ+oCT8aNz/0Ci3M0pvT0Rz5Y=";
    description = "Task runner configured with a single YAML file";
    homepage = "https://github.com/suzuki-shunsuke/cmdx";
  };

  gaze = mk {
    pname = "gaze";
    version = "1.2.1";
    subdir = "gaze_linux_v1.2.1";
    url = "https://github.com/wtetsu/gaze/releases/download/v1.2.1/gaze_linux_v1.2.1.zip";
    hash = "sha256-bhWvixETj9JN9s1ZqjpOfQuHSrl3BDX7bSTGV2N9wl4=";
    description = "Runs a command when files change";
    homepage = "https://github.com/wtetsu/gaze";
  };

  # The only dynamically linked binary in this file; autoPatchelfHook rewrites
  # its interpreter and libc reference.
  misskey-cli = mk {
    pname = "misskey-cli";
    version = "0.4.0";
    bare = true;
    url = "https://github.com/mikuta0407/misskey-cli/releases/download/v0.4.0/misskey-cli_linux_amd64";
    hash = "sha256-xptOMOZ7wybKloxpCgBLBUbcQD2KYnK43IGNTv2Afmg=";
    description = "Command line client for Misskey";
    homepage = "https://github.com/mikuta0407/misskey-cli";
  };

  chmod-cli = mk {
    pname = "chmod-cli";
    version = "0.2.0";
    url = "https://github.com/Mayowa-Ojo/chmod-cli/releases/download/v0.2.0/chmod-cli_0.2.0_Linux_x86_64.tar.gz";
    hash = "sha256-/Z4tZyU+WGSpSUF+KayFugVYviwiBFbxzAHcg1CI2rU=";
    description = "Generates chmod commands interactively";
    homepage = "https://github.com/Mayowa-Ojo/chmod-cli";
  };

  # Prefixed: nixpkgs `qq` is the Tencent QQ messenger.
  jfryy-qq = mk {
    pname = "jfryy-qq";
    version = "0.3.4";
    bin = "qq";
    url = "https://github.com/JFryy/qq/releases/download/v0.3.4/qq-v0.3.4-linux-amd64.tar.gz";
    hash = "sha256-vwS81BXPx6ZwdUm46hwoquPDKzPZljZZtcwbrhtuOU8=";
    description = "jq-style querying across many config formats";
    homepage = "https://github.com/JFryy/qq";
  };

  # Prefixed: nixpkgs `gama` is GNU Gama, a geodetic adjustment program.
  termkit-gama = mk {
    pname = "termkit-gama";
    version = "1.2.1";
    bin = "gama";
    bare = true;
    url = "https://github.com/termkit/gama/releases/download/v1.2.1/gama-linux-amd64";
    hash = "sha256-bDLpfTZjBUMNBpHKVxN7mA2POnml0uRX1Mxl12gkmms=";
    description = "Terminal UI for managing GitHub Actions workflows";
    homepage = "https://github.com/termkit/gama";
  };

  # Prefixed: nixpkgs `pingu` is an unrelated project of the same name.
  sheepla-pingu = mk {
    pname = "sheepla-pingu";
    version = "0.0.5";
    bin = "pingu";
    url = "https://github.com/sheepla/pingu/releases/download/v0.0.5/pingu_0.0.5_Linux_x86_64.tar.gz";
    hash = "sha256-vURstMZQclIVyz5ZYy/BUrNqQK/3x3hBvUwIzyPeZBg=";
    description = "ping with a penguin";
    homepage = "https://github.com/sheepla/pingu";
  };
}
