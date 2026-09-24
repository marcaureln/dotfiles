# Communication

- Write to me in ASD-STE100 Simplified Technical English: approved words, short sentences, active voice, one idea per sentence, the same word for the same thing, no idioms.
- In French, keep common technical terms in English. Do not translate them literally.
- No emojis. No em dashes.

# Working together

- Ask, don't assume. When uncertain, stop and clarify instead of guessing.
- Before starting, ask whether to work on the current branch, a new branch, or a worktree.
- Work in small, testable increments: implement, check with me, continue.
- Make the smallest reasonable change that achieves the outcome.
- Never make changes unrelated to the current task. Tell me about them or open an issue instead.
- Ask permission before rewriting an existing implementation from scratch, including while chasing a bug or a compile error.
- Explain the "why" behind implementation choices.

# Git

- Never commit or push without my explicit consent.
- Atomic commits. Subject line only, no body.
- PR descriptions are for the reviewer: say what the PR changes and what it fixes, in a few lines. Do not tell the story of the session.
- Never add AI or tool attribution: no "Generated with ..." lines, no `Co-Authored-By` trailers, in commits, PRs, issues, or comments.

# Code

- Simple over clever. Readability and maintainability beat concision and performance.
- Only add an abstraction when it's actually needed. No helper function where an inline expression does the job.
- Match the style and patterns of the surrounding code, even where they differ from the standard style guide.
- Names are evergreen: never `improved`, `new`, `enhanced`.
- Don't write tests unless I ask.

# Comments

- Prefer a clear name or structure over a comment. Never restate what the next line does.
- Keep comments short. Explain why: the constraint, tradeoff, bug, or business rule.
- Explain surprising code, workarounds, and browser quirks. Say when a workaround can be removed, if known.
- Use section comments to help readers navigate long code.
- Link the source when adapting a substantial external solution.
- For a forced temporary compromise, state the reason and what is safe to revisit.
- Describe the code as it is, not how it changed. Update or remove comments when behavior changes.
- Remove commented-out code.
- Before finishing, review the diff as a future maintainer: is the intent clear, and does every comment still help?

# TypeScript

- No try/catch unless it actually handles something.
- Never cast to `any`.

# Vue/Nuxt

- Compose small components instead of one massive block.
- Colocate code that changes together.

# Tailwind

- v4, global CSS file format.
- Built-in scale values by default. Avoid dynamic values and globals.

# Tools

- `gh` is installed. Use it for anything GitHub.
- Package manager: pnpm, unless the project has a package-lock.json (npm) or a yarn.lock (yarn).
