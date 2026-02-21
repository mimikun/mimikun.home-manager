{ config, pkgs, ... }:

{
  home.username = "mimikun";
  home.homeDirectory = "/home/mimikun";

  # NOTE: DO NOT CHANGE IT!!!
  home.stateVersion = "24.05";

  home.packages = [
    # from aqua
    pkgs.chezmoi        # twpayne/chezmoi v2.69.4
    pkgs.gh             # cli/cli v2.87.2
    pkgs.neovim
    pkgs.ghq            # x-motemen/ghq v1.9.4
    pkgs.fzf            # junegunn/fzf v0.68.0
    # from aqua (commented out - available in nixpkgs)
    #pkgs.walk          # antonmedv/walk v1.13.0
    #pkgs.trivy         # aquasecurity/trivy v0.69.1
    #pkgs.btop          # aristocratos/btop v1.4.6
    #pkgs.uv            # astral-sh/uv 0.10.4
    #pkgs.ruff          # astral-sh/ruff 0.15.2
    #pkgs.ctop          # bcicen/ctop v0.7.7
    #pkgs.bitwarden-cli # bitwarden/clients cli-v2026.1.0
    #pkgs.freeze        # charmbracelet/freeze v0.2.2
    #pkgs.glow          # charmbracelet/glow v2.1.1
    #pkgs.gum           # charmbracelet/gum v0.17.0
    #pkgs.mods          # charmbracelet/mods v1.8.1
    #pkgs.skate         # charmbracelet/skate v1.0.1
    #pkgs.vhs           # charmbracelet/vhs v0.10.0
    #pkgs.direnv        # direnv/direnv v2.37.1
    #pkgs.diffnav       # dlvhdr/diffnav v0.10.0
    #pkgs.go-tools      # dominikh/go-tools 2026.1 (includes staticcheck)
    #pkgs.editorconfig-checker # editorconfig-checker/editorconfig-checker v3.6.1
    #pkgs.lefthook      # evilmartians/lefthook v2.1.1
    #pkgs.fastfetch     # fastfetch-cli/fastfetch 2.59.0
    #pkgs.age           # FiloSottile/age v1.3.1
    #pkgs.gitleaks      # gitleaks/gitleaks v8.30.0
    #pkgs.gleam         # gleam-lang/gleam v1.14.0
    #pkgs.delve         # go-delve/delve v1.26.0
    #pkgs.lf            # gokcehan/lf r41
    #pkgs.golangci-lint # golangci/golangci-lint v2.10.1
    #pkgs.go            # golang/go go1.26.0
    #pkgs.gopls         # golang.org/x/tools/gopls v0.21.1
    #pkgs.gotools       # golang/tools (goimports v0.42.0, gorename v0.25.0)
    #pkgs.yamlfmt       # google/yamlfmt v0.21.0
    #pkgs.gopass        # gopasspw/gopass v1.16.1
    #pkgs.go-task       # go-task/task v3.48.0
    #pkgs.jump          # gsamokovarov/jump v0.67.0
    #pkgs.hadolint      # hadolint/hadolint v2.14.0
    #pkgs.dyff          # homeport/dyff v1.10.4
    #pkgs.jjui          # idursun/jjui v0.9.12
    #pkgs.lazydocker    # jesseduffield/lazydocker v0.24.4
    #pkgs.lazygit       # jesseduffield/lazygit v0.59.0
    #pkgs.lazysql       # jorgerojas26/lazysql v0.4.8
    #pkgs.jq            # jqlang/jq jq-1.8.1
    #pkgs.shellcheck    # koalaman/shellcheck v0.11.0
    #pkgs.kubescape     # kubescape/kubescape v4.0.2
    #pkgs.ls-lint       # loeffel-io/ls-lint v2.3.1
    #pkgs.slides        # maaslalani/slides v0.9.0
    #pkgs.mage          # magefile/mage v1.15.0
    #pkgs.efm-langserver # mattn/efm-langserver v0.0.55
    #pkgs.revive        # mgechev/revive v1.14.0
    #pkgs.yq-go         # mikefarah/yq v4.52.4
    #pkgs.doggo         # mr-karan/doggo v1.1.4
    #pkgs.checkmake     # mrtazz/checkmake v0.3.2
    #pkgs.duf           # muesli/duf v0.9.1
    #pkgs.shfmt         # mvdan/sh v3.12.0
    #pkgs.ali           # nakabonne/ali v0.8.0
    #pkgs.zf            # natecraddock/zf 0.10.2
    #pkgs.sq            # neilotoole/sq v0.50.0
    #pkgs.ov            # noborus/ov v0.51.1
    #pkgs.peco          # peco/peco v0.5.11
    #pkgs.mprocs        # pvolok/mprocs v0.8.3
    #pkgs.actionlint    # rhysd/actionlint v1.7.11
    #pkgs.vim-startuptime # rhysd/vim-startuptime v1.3.2
    #pkgs.yj            # sclevine/yj v5.1.0
    #pkgs.git-who       # sinclairtarget/git-who v1.3
    #pkgs.runme         # stateful/runme v3.16.5
    #pkgs.minify        # tdewolff/minify v2.24.8
    #pkgs.fq            # wader/fq v0.16.0
    #pkgs.gotop         # xxxserxxx/gotop v4.2.0
    #pkgs.superfile     # yorukot/superfile v1.5.0
    #pkgs.eget          # zyedidia/eget v1.3.4
    #pkgs.powershell    # PowerShell/PowerShell v7.5.4
    #pkgs.ncdu          # dev.yorhel.nl/ncdu 2.4
  ];

  # Home Manager is pretty good at managing dotfiles.
  # The primary way to manage plain files is through 'home.file'.
  home.file = {
    # Building this configuration will create a copy of 'dotfiles/screenrc' in the Nix store.
    # Activating the configuration will then make '~/.screenrc' a symlink to the Nix store copy.
    #".screenrc".source = dotfiles/screenrc;
  };

  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mimikun/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { EDITOR = "nvim"; };

  programs.home-manager.enable = true;
}
