# Package Manager Migration Plan

home-manager（Nix）への各パッケージマネージャからの移行計画。

## 背景・目的

- aquaが特定環境下（WSL2など）でうまく動作しない問題への対処
- 特定パッケージのリリースアセット変更への対応遅延を解消
- 宣言的な設定管理への統一（再現性・可搬性の向上）

## 現状サマリ

| パッケージマネージャ | 役割 | 件数 |
|---|---|---|
| mise | 言語ランタイム（multi-version） | 8言語 |
| aqua | CLIバイナリ（GitHub Releases） | 約65個 |
| cargo | Rustツール（`cargo install`） | 約375個 |
| gup | Goツール（`go install`） | 約244個 |
| pipx / uv tools | Pythonツール | 約60個 |
| pnpm global | Node.jsツール | 約40個 |
| rubygems | Rubyライブラリ | 多数（主に標準gems） |
| gh extension | GitHub CLI拡張 | 約15個 |

## 移行方針

### nixpkgsに移行するもの（優先）

nixpkgsに存在し、**単一バージョンで問題ないツール**を移行対象とする。

### パッケージ管理の3層構造

特にGo製ツール（gup管理）については、以下の3層で対応する：

```
Layer 1: nixpkgs (home-manager)
  → nixpkgsに収録済みのツール（再現性・宣言的管理）

Layer 2: カスタムflake derivation
  → nixpkgsに未収録だが日常的に使う重要なツール（厳選20〜30個）
  → buildGoModule / buildRustPackage で自前定義

Layer 3: gup / cargo / aqua 継続
  → 更新頻度が高い・実験的・long-tailなツール群
```

### そのまま残すもの

| 理由 | 対象 |
|---|---|
| 複数バージョン同時管理が必要 | mise管理のnode/python/zig |
| 開発版（master/nightly）が必要 | vim ref:master、zig master |
| nixpkgsに存在しない（long-tail） | niche系ツールの大半 |
| 更新頻度が高く管理コストが大きい | 実験的・個人開発系ツール |

---

## フェーズ別計画

### Phase 1: aqua管理ツールの移行（最優先）

aquaが問題を起こしている主因のため最初に対処。

#### nixpkgsに移行できるツール（aqua → home-manager）

```nix
# home.packages に追加候補
pkgs.btop           # aristocratos/btop
pkgs.trivy          # aquasecurity/trivy
pkgs.jq             # jqlang/jq
pkgs.direnv         # direnv/direnv
pkgs.kubectx        # ahmetb/kubectx
pkgs.k9s            # derailed/k9s
pkgs.shellcheck     # koalaman/shellcheck
pkgs.hadolint       # hadolint/hadolint
pkgs.gdu            # dundee/gdu
pkgs.fastfetch      # fastfetch-cli/fastfetch
pkgs.gitleaks       # gitleaks/gitleaks
pkgs.gleam          # gleam-lang/gleam
pkgs.vegeta         # tsenart/vegeta
pkgs.go-tools       # dominikh/go-tools/staticcheck
pkgs.uv             # astral-sh/uv
pkgs.ruff           # astral-sh/ruff
pkgs.mods           # charmbracelet/mods
pkgs.duf            # muesli/duf
pkgs.ctop           # bcicen/ctop
pkgs.chezmoi        # twpayne/chezmoi (既存)
pkgs.fzf            # junegunn/fzf (既存)
pkgs.gh             # cli/cli (既存)
```

#### nixpkgsへの収録確認が必要なもの（aqua）

```
# 以下は要確認（nixpkgs search で調べる）
babarot/gomi        → pkgs.gomi ?
bitwarden/clients   → pkgs.bitwarden-cli ?
charmbracelet/mods  → pkgs.mods ✓ (確認済み)
dagu-org/dagu       → pkgs.dagu ?
danvergara/dblab    → pkgs.dblab ?
dlvhdr/diffnav      → pkgs.diffnav ?
dotenvx/dotenvx     → pkgs.dotenvx ?
git-bug/git-bug     → pkgs.git-bug ?
guumaster/hostctl   → pkgs.hostctl ?
idursun/jjui        → pkgs.jjui ?
JFryy/qq            → pkgs.qq ?
kdabir/has          → pkgs.has ?
kubescape/kubescape → pkgs.kubescape ?
loeffel-io/ls-lint  → pkgs.ls-lint ?
mr-karan/doggo      → pkgs.doggo ?
mrtazz/checkmake    → pkgs.checkmake ?
naggie/dstask       → pkgs.dstask ?
natecraddock/zf     → pkgs.zf ?
pamburus/hl         → pkgs.hl ?
pkgxdev/pkgx        → pkgs.pkgx ?
pvolok/mprocs       → pkgs.mprocs ?
sclevine/yj         → pkgs.yj ?
sheepla/pingu       → (niche、要確認)
sqshq/sampler       → pkgs.sampler ?
suzuki-shunsuke/cmdx → pkgs.cmdx ?
termkit/gama        → pkgs.gama ?
tsl0922/ttyd        → pkgs.ttyd ?
tstack/lnav         → pkgs.lnav ?
wtetsu/gaze         → pkgs.gaze ?
yassinebenaid/bunster → (新規ツール)
yorukot/superfile   → pkgs.superfile ?
```

#### aquaに残すもの

```
# nixpkgsに収録されていない / カスタムレジストリ利用
mikuta0407/misskey-cli  (カスタムレジストリ)
Mayowa-Ojo/chmod-cli    (カスタムレジストリ)
kisielk/errcheck        (go-installレジストリ)
PowerShell/PowerShell   (バイナリ配布)
dev.yorhel.nl/ncdu      (GitHub以外)
```

---

### Phase 2: cargoツールの移行

約375個あるが、nixpkgsで管理すべきは「開発ツール・CLIユーティリティ」のみ。
ライブラリ系・実験的ツール・プロジェクト固有のものはcargoのまま。

#### nixpkgsに移行する主要ツール（cargo → home-manager）

```nix
pkgs.bat              # bat
pkgs.ripgrep          # ripgrep
pkgs.fd               # fd-find
pkgs.eza              # eza
pkgs.zoxide           # zoxide
pkgs.starship         # starship
pkgs.delta            # git-delta
pkgs.hyperfine        # hyperfine
pkgs.tokei            # tokei
pkgs.just             # just
pkgs.atuin            # atuin
pkgs.bottom           # bottom
pkgs.broot            # broot
pkgs.du-dust          # du-dust
pkgs.dua              # dua-cli
pkgs.lsd              # lsd
pkgs.mdbook           # mdbook
pkgs.nushell          # nu
pkgs.ouch             # ouch
pkgs.pueue            # pueue
pkgs.ripgrep-all      # ripgrep_all
pkgs.sd               # sd
pkgs.silicon          # silicon
pkgs.skim             # skim
pkgs.stylua           # stylua
pkgs.tealdeer         # tealdeer
pkgs.tree-sitter      # tree-sitter-cli
pkgs.typos            # typos-cli
pkgs.viu              # viu
pkgs.watchexec        # watchexec-cli
pkgs.xh               # xh
pkgs.yazi             # yazi-fm + yazi-cli
pkgs.zellij           # zellij
pkgs.mise             # mise自体もnixpkgsにある
pkgs.cargo-nextest    # cargo-nextest
pkgs.cargo-edit       # cargo-edit
pkgs.cargo-audit      # cargo-audit
pkgs.cargo-deny       # cargo-deny
pkgs.cargo-tarpaulin  # cargo-tarpaulin
pkgs.difftastic       # difftastic
pkgs.gitui            # gitui
pkgs.gitu             # gitu
pkgs.presenterm       # presenterm
pkgs.procs            # procs
pkgs.mcfly            # mcfly
```

#### cargoに残すもの

- nixpkgsに未収録のniche系ツール
- 言語サーバー・開発補助ツール（`emmylua_ls`, `harper-ls`, `rscls`等）
- 実験的・個人開発系ツール
- カーゴプラグインで頻繁に更新が必要なもの

---

### Phase 3: gupツール（Go install）の移行

244個のGoツールを3層構造で対応する。

#### gupパッケージの分類

| グループ | 件数 | 割合 | 対応 |
|---|---|---|---|
| A: nixpkgsにほぼ確実に収録 | ~65個 | 27% | Phase 3a: home-managerへ移行 |
| B: nixpkgsに収録されているか要確認 | ~75個 | 31% | Phase 3a: 確認後に判断 |
| C: nixpkgsに未収録（ニッチ系） | ~104個 | 43% | Phase 3b/3c で対応 |

#### Phase 3a: nixpkgsへの移行（Group A/B）

```nix
# Group A — nixpkgsにほぼ確実にあるもの
pkgs.actionlint       # rhysd/actionlint
pkgs.age              # filippo.io/age
pkgs.go-task          # go-task/task
pkgs.ghq              # x-motemen/ghq (既存)
pkgs.golangci-lint    # golangci/golangci-lint
pkgs.gopls            # golang.org/x/tools/gopls
pkgs.lazygit          # jesseduffield/lazygit
pkgs.lazydocker       # jesseduffield/lazydocker
pkgs.lf               # gokcehan/lf
pkgs.glow             # charmbracelet/glow
pkgs.gum              # charmbracelet/gum
pkgs.vhs              # charmbracelet/vhs
pkgs.peco             # peco/peco
pkgs.shfmt            # mvdan.cc/sh (gosh + shfmt)
pkgs.scc              # boyter/scc
pkgs.yq               # mikefarah/yq
pkgs.osv-scanner      # google/osv-scanner
pkgs.editorconfig-checker  # editorconfig-checker
pkgs.d2               # terrastruct/d2
pkgs.dive             # wagoodman/dive
pkgs.efm-langserver   # mattn/efm-langserver
pkgs.goreleaser       # goreleaser/goreleaser (要確認)
pkgs.slides           # maaslalani/slides
pkgs.yamlfmt          # google/yamlfmt
pkgs.lefthook         # evilmartians/lefthook
```

#### Phase 3b: カスタムflake derivation（Group C 重要ツール）

nixpkgsに未収録だが日常的に使う重要ツールを `pkgs/go-tools/` に自前定義する。
**選定基準：**
- 日常使いしているツール
- 安定版リリースがある
- upstream が `vendor/` をコミットしている場合は `vendorHash = null` で楽に管理できる

```
home-manager/
├── flake.nix          # overlays を追加
├── home.nix
└── pkgs/
    └── go-tools/
        ├── default.nix    # 全ツールのimport
        ├── tool-a.nix
        └── tool-b.nix
```

**flake.nix への追加：**
```nix
outputs = { self, nixpkgs, home-manager }:
let
  pkgs = import nixpkgs {
    inherit system;
    overlays = [
      (final: prev: {
        customGoTools = import ./pkgs/go-tools { pkgs = final; };
      })
    ];
  };
in { ... };
```

**ツール定義例（pkgs/go-tools/example.nix）：**
```nix
{ buildGoModule, fetchFromGitHub }:
buildGoModule {
  pname = "example-tool";
  version = "1.2.3";
  src = fetchFromGitHub {
    owner = "owner";
    repo = "repo";
    rev = "v1.2.3";
    hash = "sha256-xxx";
  };
  # vendor/ がコミットされている場合は null でハッシュ更新不要
  vendorHash = null;
  # ない場合は以下（バージョン更新時に lib.fakeHash で再取得）
  # vendorHash = "sha256-yyy";
}
```

**バージョン更新時のtip：**
```nix
# vendorHash を lib.fakeHash に設定してビルド → エラーメッセージから正しいハッシュを取得
vendorHash = lib.fakeHash;
```

#### Phase 3c: gup継続（残りのlong-tail）

以下はgupで継続管理：
- 実験的・個人開発系ツール（更新頻度が高い）
- MCP関連ツール等の新興ツール
- 使用頻度が低いniche系ツール

---

### Phase 4: 言語ランタイム（mise）の整理

#### nixpkgsに移行できるもの（単一バージョンでよい場合）

```nix
pkgs.erlang         # erlang (mise: latest)
pkgs.ruby           # ruby (mise: latest)
pkgs.lua5_1         # lua 5.1
pkgs.dotnet-sdk     # dotnet-core (mise: latest)
```

#### miseに残すもの（必須）

```
node   - lts/22/latest/23 の複数バージョン管理が必要
python - 3.11/3.12/3.13/latest の複数バージョン管理が必要
zig    - master + latest 両方が必要
vim    - ref:master (開発版)
```

---

### Phase 5: pipx / uv tools の整理

PythonツールはAI/MLツールが多く、nixpkgsより pip/uv の方が追従が速い。
CLIツールとして一般化しているもののみ移行を検討。

#### 移行候補

```nix
pkgs.aider-chat     # aider-chat (要確認)
pkgs.yt-dlp         # (uv tools経由の場合)
```

#### pipx/uv に残すもの

大半はそのまま（AI/MLライブラリ系は nixpkgs で管理が困難）。

---

### Phase 6: pnpm global / gh extension の整理

#### pnpm global → nixpkgsへ移行候補

```nix
pkgs.nodePackages.prettier   # prettier
pkgs.nodePackages.repomix    # repomix (要確認)
```

#### gh extensionについて

gh extensionはhome-managerの `programs.gh.extensions` で管理可能。

```nix
programs.gh = {
  enable = true;
  extensions = with pkgs; [
    # gh-dash, gh-poi 等（nixpkgsにあるもの）
  ];
};
```

---

## カスタムflakeパッケージング全般

Go以外のツール（Rustツール等）でも同様にカスタムderivationを定義できる。

```
pkgs/
├── go-tools/       # buildGoModule ベース
│   ├── default.nix
│   └── *.nix
└── misc/           # fetchurl等でバイナリ直接取得する場合
    └── *.nix
```

nixpkgsに未収録でも `buildRustPackage`（Rust）や `fetchurl`（配布バイナリ）でも対応可能。
ただし維持管理コストを考慮し、**重要度が高いツール20〜30個程度に留める**のが現実的。

---

## 実装方針

### home.nixの構造化

パッケージ数が増えるため、カテゴリ別にリスト化する。

```nix
home.packages = with pkgs; [
  # --- CLI Utilities ---
  btop jq direnv fzf

  # --- Development Tools ---
  gh ghq delta gitui

  # --- File Tools ---
  bat eza fd ripgrep

  # --- Rust Toolchain Helpers ---
  cargo-nextest cargo-edit

  # --- Language Runtimes (single version) ---
  erlang ruby lua5_1
];
```

### 段階的移行のすすめ方

1. nixpkgs search / nixpkgs.com で各ツールの収録確認
2. `home-manager switch` で動作確認
3. 旧パッケージマネージャから該当ツールを削除
4. 問題があれば旧マネージャに戻す

---

## 優先度

| 優先度 | フェーズ | 理由 |
|---|---|---|
| 高 | Phase 1（aqua） | aquaの動作不良が直接の動機 |
| 中 | Phase 2（cargo主要ツール） | 管理の統一化 |
| 中 | Phase 3（gup） | 3層構造で段階的に移行 |
| 低 | Phase 4（mise言語） | 移行できるものは少ない |
| 低 | Phase 5-6（pip/pnpm/gh） | 影響範囲が小さい |

---

## 注意事項

- `home.stateVersion = "24.05"` は変更禁止
- 変更前は必ず `task pab` でpatch branchを作成
- 移行後は `home-manager switch --flake .#mimikun` で動作確認
- nixpkgsのバージョンはflake.lockで固定されるため、最新版が欲しい場合はaqua/cargo継続を検討
