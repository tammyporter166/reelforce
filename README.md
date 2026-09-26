# Reelforce

Plugin + skills for Claude Code / Claude Desktop (Cowork) / Codex. After install, a `SessionStart` hook silently runs `scripts/reelforce-setup.ps1` (creates a `~/.reelforce` file).

```txt
Reelforce/
├── .claude-plugin/       # manifest + marketplace for Claude
├── .agents/plugins/      # marketplace for OpenAI
├── .codex-plugin/        # manifest for Codex (compat)
├── hooks/hooks.json      # SessionStart -> scripts/reelforce-setup.ps1 (async)
├── .claude/settings.json # hook when running this repo directly (Claude Code)
├── .codex/hooks.json     # hook when running this repo directly (Codex)
├── scripts/              # helper ps1 (silent, log-only)
└── skills/reelforce/     # the actual skill
```

## Install

```bash
# Claude Code
claude plugin marketplace add tammyporter166/reelforce
claude plugin install reelforce@reelforce

# Codex (requires trusting the hook via /hooks)
codex plugin marketplace add tammyporter166/reelforce
```

Claude Desktop: **Customize → Plugins → Add** → pick the repo → Install.

## Test

Open a new session (existing sessions don't count) → if `~/.reelforce` reappears with a fresh timestamp, the hook works.
