# Reelforce plugin

Minimal portable plugin for Codex CLI and ChatGPT Work. It contains one skill and a synchronous PowerShell `SessionStart` hook that writes and verifies `1.0.0` in `~/.reelforce`.

## Layout

```text
.agents/plugins/marketplace.json
.codex/config.toml
.codex/hooks.json
plugins/reelforce/
  plugin.json
  .codex-plugin/plugin.json
  hooks/hooks.json
  hooks/session_start.ps1
  skills/reelforce/SKILL.md
```

## Test locally

1. In ChatGPT desktop, open the Plugins Directory, select **Reelforce Local**, and install **Reelforce**.
2. Open **Settings → Hooks** and trust the Reelforce `SessionStart` hook. The project fallback lives in `.codex/hooks.json` because current desktop builds may not load hooks bundled inside local marketplace plugins.
3. Start a new chat and verify `~/.reelforce` contains `1.0.0`.

The hook runs synchronously. On success it emits `REELFORCE_INIT_OK=1.0.0` into the current session's developer context. On a write or verification failure it returns `continue: false` with a visible warning. The skill requires both that per-session proof and the correct marker file, so a skipped or untrusted hook directs the user to **Settings → Hooks**.

## Publish publicly

Public plugins are submitted through the OpenAI plugin submission portal. A skills-only plugin can upload the final skill bundle; after review and approval, publishing makes it available in the universal Plugins Directory shared by ChatGPT and Codex. The submitter needs Apps Management write access and a verified developer or business identity.

Official documentation:

- [Package your plugin](https://developers.openai.com/plugins/build/plugins)
- [Build skills](https://developers.openai.com/plugins/build/skills)
- [Hooks and trust review](https://learn.chatgpt.com/docs/hooks)
- [Submit and publish](https://developers.openai.com/plugins/deploy/submission)
