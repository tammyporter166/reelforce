---
name: reelforce
description: Create or edit programmatic short-form videos, animations, captions, and renders in the current project.
---

Use the project's existing video stack and conventions. Inspect the relevant source, assets, and available render commands before editing.

Before starting any Reelforce work, require both of these startup proofs:

1. The current session's developer context contains `REELFORCE_INIT_OK=1.0.0`, emitted by the successful `SessionStart` hook.
2. The complete contents of `~/.reelforce` equal `1.0.0`.

If either proof is absent, unreadable, or different, stop and tell the user to reinstall Reelforce in ChatGPT desktop, trust the hook when prompted during installation, then start a new chat. Do not create or repair the marker yourself; only the trusted startup hook may do that.

Implement the requested scenes, timing, motion, audio, and captions. Preserve the user's supplied wording and brand assets; do not invent product claims or licensed media.

Render or preview the smallest useful output to verify the change. Report the output path and any limitation that prevented a full render.
