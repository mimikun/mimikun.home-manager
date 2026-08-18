# Package Manager Migration Plan

home-manager（Nix）へ、各パッケージマネージャから段階的に移行する計画。

**2026-08-18 に全面的に書き直した。** 旧版は 2026-04-04 時点のもので、
Phase 1 の完了と、そこで判明した事実がどこにも反映されていなかった。
旧版の内容は `git log -- docs/plans/package-manager-migration.md` にある。

## 旧版から変わった点（読み飛ばさないこと）

1. **Phase 1 は完了した**（2026-08-17 宣言 / 2026-08-18 実体撤去、13GB 回収）
2. **移行の動機が差し替わった。** 旧版は「aqua が WSL2 で動作不良」と書いていたが、
   実測ではそうではなかった。aqua の上流は活発（2026-08 時点で最新 v2.62.3）。
   止まっていたのは手元が v2.57.1 で固まっていたからで、原因は
   **`AQUA_GITHUB_TOKEN` の失効**（GitHub API が 401）。
   `aqua update-aqua` は手で叩いたときにしかエラーを出さないので**5ヶ月気づけなかった**
   - **次に効くのは「上流が死んでいる」ではなく
     「認証を持たせる運用は、黙って壊れて気づけない」のほう**
3. **件数が全部古い。** 下の「現状」は 2026-08-18 の実測に差し替えた
4. **旧版に並んでいた移行候補リスト（Phase 2 の47個など）は削除した。**
   数える前に書かれたもので、実測すると規模が違った（下記）。
   **候補の列挙は、着手するフェーズでその都度測って作る**

## 移行の原則（Phase 1 で得たもの。次のフェーズにそのまま効く）

1. **着手前に数える。** Phase 1 では「aqua だけが持つ111個」が、
   実際には**9個の確認**に縮んだ（102個は `~/go/bin` にも在り、
   PATH で aqua が gup に勝っていただけだった）。
   **同じことが5回起きている。書いてある数字は、見る前に信じない**
2. **重複を先に探す。** 1 の実体はこれ。**ただし Phase 2 では重複はゼロだった**（下記）
3. **名前の一致を同一性の証拠にしない。** `meta.homepage` を owner/repo と
   突き合わせること。Phase 1 では `qq` が Tencent QQ、`gama` が GNU 測地網平差、
   `pingu` が別作者だった。逆に `hl` は **`hl-log-viewer` という別名で存在**していた。
   **名前で引いて無ければ諦める、をやっていたら1件取りこぼし3件は別物を入れていた**
4. **PATH で勝てるかを先に見る。** 宣言しても、前に別のものが居れば効かない。
   2026-08-18 に `go` で実際に踏んだ（aqua を外したら mise ではなく `/usr/bin/go` が出た）
5. **dry-run が保証する範囲を取り違えない。** `nix flake check` は評価しか見ない。
   PowerShell 2本の衝突は **profile 構築時にしか出なかった**
6. **上書きせず、追加する。** 名前が衝突する場合、nixpkgs の attribute を
   上書きすると、それを参照する別パッケージに違う中身が渡る。接頭辞付きで足す
7. **「消して入れ直す」の前に、消す理由が成立するか測る。**
   Phase 1 の発端は「Nix を消して unstable で入れ直す」だったが、
   実際に止めていたのは6ヶ月前で固定された `flake.lock` 1つだった

## 現状（2026-08-18 実測）

| 管理系 | 役割 | 件数 |
|---|---|---|
| **nix (home-manager)** | 宣言済みパッケージ | **67**（うち overlay 由来 12） |
| | `~/.nix-profile/bin` の実行ファイル | **97** |
| mise | 言語ランタイム（複数版） | 12ツール / 20エントリ |
| cargo | Rust ツール | **452** パッケージ / `~/.cargo/bin` に 536 本 |
| gup | Go ツール | **296** |
| uv tools | Python ツール | **109** |
| pip | Python パッケージ | 722（大半は依存） |
| rubygems | Ruby | 104（大半は標準 gem） |
| pnpm global | Node ツール | 89（**ただし v11 が認識するのは10個。Phase 6 参照**） |
| gh extension | gh 拡張 | 18 |
| pacman / AUR | OS パッケージ | 226 / 106 |

**PATH の順序（fish のログインシェル、2026-08-18 実測）**

| 位置 | パス |
|---|---|
| **1** | `~/.nix-profile/bin` |
| 17 | `~/.cargo/bin` |
| 18 | `~/go/bin` |
| 20 | `/usr/bin` |
| 27以降 | mise の install ディレクトリ群 |

**nix は1番目。移した時点で必ず勝つ。** 原則 4 の心配は、
nix へ移す方向についてはしなくてよい。逆に「nix から外す」ときには効く。

## Phase 1: aqua の移行 — ✅ 完了

- **宣言の移行（2026-08-17）**: `mimikun.home-manager` PR #3〜#6、
  `mimikun/dotfiles` PR #3670 / #3671 / #3673 / #3674
- **実体の撤去（2026-08-18）**: `mimikun/dotfiles` PR #3675、
  `mimikun.fish-config` PR #7。**13GB 回収**
- **失われたコマンドは176個中6個だけで、すべて意図したもの**
  （`aqua` 本体 / `gorename`・`xcbeautify` は廃止決定 /
  `ls-lint`・`twitch` は nix 側で改名し旧名を残さないと決めた）
- 構造として残ったもの: `overlays/`（1 overlay 1ファイル。
  各ファイルに**在る理由**と**消す条件**を書く）、
  nixpkgs に無いものは「上流のリリース済みバイナリを置く」形

**判断の記録は `mimikun.agent-system` の `todo.md` にある。ここに写さない。**

## Phase 2: cargo ツール — ← 次はここ

### 実測（2026-08-18）

| | |
|---|---|
| cargo パッケージ | **452** |
| `~/.cargo/bin` の実行ファイル | 536 |
| **クレート名がそのまま nixpkgs の attribute として存在** | **248 / 452（55%）** |
| **nix profile と重複しているコマンド** | **0** |
| `/usr/bin` と名前が重なるコマンド | 39（PATH では cargo が勝つ） |

確認に使った式（`flake.lock` が指す nixpkgs に対して評価する）:

```bash
nix eval --impure --raw --expr '
let
  flake = builtins.getFlake "path:/home/mimikun/.config/home-manager";
  pkgs = import flake.inputs.nixpkgs { system = "x86_64-linux"; };
  names = builtins.filter (n: builtins.isString n && n != "")
    (builtins.split "\n" (builtins.readFile "/path/to/names.txt"));
in builtins.concatStringsSep "\n" (builtins.filter (n: builtins.hasAttr n pkgs) names)'
```

### Phase 1 との違い（ここが計画に効く）

- **重複による「やらなくてよい」は無い。** Phase 1 は111個が9個に縮んだが、
  cargo と nix profile の重複は**ゼロ**。減らせる分は最初から無い
- **248 という数字は下限。** クレート名と attribute 名が食い違うものは
  この数え方では出てこない（`hl` → `hl-log-viewer` と同じ形）。
  **残り204個を「無い」と扱わないこと**（原則 3）
- **移行しても cargo は消えない。** 言語サーバーや個人開発系は nixpkgs に無い。
  Phase 2 の成果は「cargo の廃止」ではなく「**cargo が管理する数を減らすこと**」

### 決めること（TBD。**AI は埋めない**）

1. **母集団** — 452個全部を対象にするのか、
   「実際に使っているもの」に絞るのか。**絞るなら、その判定をどう取るか**
   （Phase 1 では本人が「全部そのまま入れる」を選んだ。同じ判断でよいかは未確認）
2. **248個の扱い** — 一度に移すのか、区切って移すのか。区切るなら単位は何か
3. **終了条件** — 「移したツールが動けば完了」でよいか
   （Phase 1 はこれで決着した。再現性・別マシンは条件に入れないと決めてある）

### 着手したときの最初の1歩（決まっているもの）

**残り204個の attribute 名を引き直す。** 名前が一致しないだけで存在するものが
混ざっている（原則 3）。ここを飛ばすと、あとで「実は在った」が出てきて
overlay に自前定義を書いた分が無駄になる。

## Phase 3: gup（Go ツール）

### 実測（2026-08-18）

| | |
|---|---|
| gup 管理のバイナリ | **296** |
| うち Phase 1 で aqua と重複していたもの | 102（**aqua 側を消した。gup 側が残っている**） |

**旧版が書いていた「244個を A/B/C の3層に分類（65 / 75 / 104）」は
数える前の見積もりなので削除した。** 分類は着手時に測り直す。

### 決めること（TBD）

1. nixpkgs 実在確認を Phase 2 と同じ方法で取る（上のコマンドが流用できる）
2. **`vup` との関係** — gup は `gup update <name>` を296タスクに割って
   毎日走らせている（`mimikun.scripts` PR #29）。nix へ移した分は
   **gup 側からも消さないと、二重管理のまま毎日ビルドされ続ける**
3. 終了条件 TBD

## Phase 4: mise（言語ランタイム）

**移せるものは少ない。** 複数バージョンが要るもの（node 4系統、python 4系統、
zig の master + latest、vim の `ref:master`）は mise に残る。

- 単一バージョンでよいもの（erlang / ruby / lua / dotnet）は候補になりうる
- **ただし `dotnet` は 2026-08-18 に「WARN を出しながら exit 0」で壊れていたのを
  直したばかり**（`mimikun/dotfiles` PR #3678）。動いているものを動かす価値は低い
- **優先度は低い。TBD**

## Phase 5: uv tools / pip

- uv tools は **109本**。1ツール = 1タスクで毎日更新している
- **`uv tool upgrade` は各ツールの Python を維持する**ので、
  nix へ移すと**インタプリタの固定先が nixpkgs 側に移る**。ここは性質が変わる
- AI/ML 系は nixpkgs より uv のほうが追従が速い。**大半は移さない**
- **優先度は低い。TBD**

## Phase 6: pnpm global / gh extension

- **pnpm はここに入る前に、壊れている状態を直す必要がある。**
  `global/5` に73個・4.2GB が取り残され、shim 87本が絶対パスで生きているが、
  `pnpm list -g` が認識するのは10個だけ。**`pnpm update -g` も `pnpm rm -g` も効かない**
  （詳細は `mimikun.agent-system` の `todo.md`）
- gh extension は 18個。`programs.gh.extensions` で宣言できるが、
  **nixpkgs に在るものに限られる**
- **優先度は低い。TBD**

## リポジトリの構造（現状）

```
home-manager/
├── flake.nix              # import nixpkgs（legacyPackages では overlay が効かない）
├── home.nix               # imports のみ
├── packages/
│   ├── default.nix
│   ├── cli.nix            # 25個
│   └── dev-tools.nix      # 42個
├── overlays/
│   ├── default.nix        # 適用順
│   ├── powershell.nix     # 2バージョン併存（preview を pwsh-unstable に）
│   └── prebuilt-github-tools.nix  # nixpkgs に無い12個
├── files.nix / env.nix / programs.nix
└── docs/plans/            # このファイル
```

**パッケージが増えたらカテゴリ別にファイルを足す。**
1ファイルに全部入れると、どのフェーズで入ったものか追えなくなる。

## 適用と検証

```bash
home-manager switch --flake .#mimikun   # 適用
nix flake check                          # 評価だけ。原則 5 に注意
nix flake update                         # 入力の更新
```

**移行後の確認は「宣言した数」ではなく「使えるコマンド」で取る。**
Phase 1 では176本の shim を1本ずつ PATH で引き直して、消えた6本を特定した。
