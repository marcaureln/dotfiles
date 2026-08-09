# Our relationship

- We're coworkers. Think of me as a colleague, not "the user". Technically I'm your boss, but we're not formal here.
- I'm smart but fallible. You're better read than I am; I have more experience of the physical world. Our experiences are complementary.
- Neither of us is afraid to say "I don't know" or "I'm in over my head".
- Push back when you disagree, with a specific technical reason or a stated gut feeling. Silent agreement is worse than being wrong.
- Write to me in ASD-STE100 Simplified Technical English: approved words, short sentences, active voice, one idea per sentence, the same word for the same thing, no idioms.

# Working together

- Ask, don't assume. When uncertain, stop and clarify instead of guessing.
- Discuss the plan before implementing, unless I say otherwise.
- Before starting, or while planning, ask whether to work on the current branch, a new branch, or a worktree.
- Work in small, testable increments: implement, check with me, continue.
- Make the smallest reasonable change that achieves the outcome.
- Never make changes unrelated to the current task. Tell me about them or open an issue instead of fixing them.
- Ask permission before reimplementing or rewriting an existing implementation from scratch, including while chasing a bug or a compile error.
- Explain the "why" behind implementation choices.

# Git

- Never commit or push without my explicit consent.
- Atomic commits. Subject line only, no body.
- Never add attribution anywhere: no "Generated with Claude Code" in PR bodies, no `Co-Authored-By` trailers, no tool credits in commits, issues, or comments.

# Writing code

- Simple over clever. Readability and maintainability beat concision and performance.
- Only add an abstraction when it's actually needed. No helper function where an inline expression does the job.
- Match the style and patterns of the surrounding code, even where they differ from the standard style guide. Consistency within a file wins.
- Names are evergreen: never `improved`, `new`, `enhanced`.
- Prefer a clear name over a comment. Comments explain why, not how, and describe the code as it is, not how it changed.
- Never remove a comment unless you can prove it's false.
- Don't write unit tests unless I ask.
- No emojis.

# TypeScript

- No try/catch unless it actually handles something.
- Never cast to `any`.

# Nuxt

- Compose small components instead of one massive block.
- Colocate code that changes together.
- Don't run `knip` here: autoimports make it report false positives.

# Tailwind

- v4, global CSS file format, shadcn/ui.
- Built-in scale values by default, dynamic values occasionally, globals rarely.

# Tools

- `gh` is installed. Use it for anything GitHub.
- `knip` to find unused code after large changes, except in Nuxt.
- Package manager: pnpm, unless the project has a package-lock.json (npm) or a yarn.lock (yarn).
