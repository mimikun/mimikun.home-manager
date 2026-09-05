{ config, pkgs, ... }:
{
  home.file = {
    # Two hooks in ~/.claude/settings.json name these binaries by absolute path
    # rather than letting PATH resolve them, so putting the packages in
    # `home.packages` alone leaves the hooks pointing at nothing. The links put
    # a binary at the path the hooks already spell out.
    #
    # Store symlinks, not out-of-store ones: the targets are Nix derivations, so
    # they move with each generation and nothing writes to them.
    #
    # Delete these when settings.json switches to bare command names. The third
    # tool of the set, rtk, already does that and needs no link.
    ".local/bin/lazy-tmux".source = "${pkgs.lazy-tmux}/bin/lazy-tmux";
    ".git-ai/bin/git-ai".source = "${pkgs.git-ai}/bin/git-ai";

    # Add dotfile symlink definitions here
    # ".screenrc".source = dotfiles/screenrc;

    # OMP's personality block. The body is Anthropic's own text, lifted from the
    # `Concise` output style built into the Claude Code binary, so it cannot be
    # committed here — this repo is public. The real file lives in the private
    # `mimikun.agent-system` repo and only its path appears below.
    #
    # An out-of-store symlink, not `.text`: keeping the body out of the Nix
    # store is the entire point. OMP reads this file and never writes it, so a
    # symlink is safe (unlike `config.yml`, which OMP rewrites in place).
    #
    # If `mimikun.agent-system` is not cloned, the link dangles and OMP falls
    # back to the configured `personality` preset without an error.
    ".omp/agent/PERSONALITY.md".source =
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/ghq/github.com/mimikun/mimikun.agent-system/omp/PERSONALITY.md";

    ".pi/agent/extensions/exit-command.ts".text = ''
      import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

      export default function (pi: ExtensionAPI) {
        pi.registerCommand("exit", {
          description: "Quit pi",
          handler: async (_args, ctx) => {
            ctx.shutdown();
          },
        });
      }
    '';

    # Tool policy for the remote-control session that `/rc` starts. Passed to
    # that session as `--config`, which OMP never persists, so a read-only
    # store symlink is correct here (unlike config.yml, which OMP rewrites).
    #
    # `deny` is the only gate a collab guest cannot lift: it is absolute, it is
    # evaluated before the approval mode, and settings changes are host-only.
    # Approval prompts are NOT a defense here — they are broadcast to every
    # writable guest, so whoever holds the full link can approve their own
    # requests. Denying the exec tools is what bounds a leaked link.
    ".config/omp/overlays/rc-gate.yml".text = ''
      tools:
        approvalMode: write
        approval:
          bash: deny
          eval: deny
          browser: deny
          computer: deny
          debug: deny
          task: deny
    '';

    # /rc — open a remote-control session before going out: new Herdr
    # workspace, a fresh OMP under the deny overlay above, then `/collab`.
    #
    # The link is deliberately never printed or copied anywhere: the QR code
    # `/collab` draws in that pane is read straight off the screen with a
    # phone, so the room secret never crosses a network or a clipboard.
    #
    # Driving a second session from outside is the only available shape:
    # ExtensionAPI has no way to invoke a slash command, and `/collab` needs
    # the interactive TUI context.
    ".omp/agent/extensions/rc.ts".text = ''
      import type { ExtensionAPI } from "@oh-my-pi/pi-coding-agent";
      import { spawnSync } from "node:child_process";
      import { homedir } from "node:os";
      import { join } from "node:path";

      const AGENT_NAME = "rc";
      const OVERLAY = join(homedir(), ".config/omp/overlays/rc-gate.yml");

      function herdr(args: string[]): any {
        const run = spawnSync("herdr", args, { encoding: "utf8", timeout: 90_000 });
        if (run.error) throw run.error;
        if (run.status !== 0) {
          const detail = (run.stderr || run.stdout || "").trim();
          throw new Error(`herdr ''${args.slice(0, 2).join(" ")}: ''${detail}`);
        }
        const out = run.stdout.trim();
        return out ? JSON.parse(out) : {};
      }

      function liveRcPane(): string | undefined {
        try {
          return herdr(["agent", "get", AGENT_NAME]).result?.agent?.pane_id;
        } catch {
          return undefined;
        }
      }

      export default function rcExtension(pi: ExtensionAPI) {
        pi.registerCommand("rc", {
          description: "Remote control: new workspace + OMP session published over collab",
          handler: async (_args, ctx) => {
            if (process.env.HERDR_ENV !== "1") {
              ctx.ui.notify("/rc needs to run inside a Herdr pane (HERDR_ENV=1).", "error");
              return;
            }

            const existing = liveRcPane();
            if (existing) {
              herdr(["agent", "focus", AGENT_NAME]);
              ctx.ui.notify(`Remote-control session already live in ''${existing}. Scan the QR there.`, "warn");
              return;
            }

            try {
              const created = herdr([
                "workspace", "create",
                "--label", "remote-control",
                "--cwd", ctx.cwd,
                "--no-focus",
              ]).result;
              const pane: string = created.root_pane.pane_id;

              herdr([
                "agent", "start", AGENT_NAME,
                "--kind", "omp",
                "--pane", pane,
                "--timeout", "60000",
                "--", "--config", OVERLAY,
              ]);

              herdr(["agent", "prompt", AGENT_NAME, "/collab"]);
              herdr([
                "pane", "wait-output", pane,
                "--regex", "Collab session started",
                "--source", "recent-unwrapped",
                "--timeout", "30000",
              ]);

              herdr(["workspace", "focus", created.workspace.workspace_id]);
              ctx.ui.notify("Remote control up. Scan the QR in this pane, then /collab stop when back.", "info");
            } catch (err) {
              ctx.ui.notify(`/rc failed: ''${err instanceof Error ? err.message : String(err)}`, "error");
            }
          },
        });
      }
    '';
  };
}
