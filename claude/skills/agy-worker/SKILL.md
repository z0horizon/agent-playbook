---
name: agy-worker
description: Use when the user invokes /agy-worker or asks to change the agy (Antigravity CLI) worker mode for the current chat session - off, strict, task or advisor - or the worker model (Gemini 4 Argon or Gemini 3.8 Flash) and its effort (low, medium, high). Session-scoped switch for the agy delegation protocol in ~/.claude/CLAUDE.md.
disable-model-invocation: true
---

# agy Worker Mode

Session-scoped mode switch for the `agy` delegation protocol defined in `~/.claude/CLAUDE.md` (section 0 "agy Worker Mode", and the agy parts of sections 1-3). The default for every chat is **off**, with the worker model `gemini-3.8-flash-high`; this skill is the only way to change them.

| Mode | What `agy` may do |
|------|-------------------|
| `off` | Nothing, apart from UI work while the agy UI mode is on. |
| `strict` | Research, and execution of an exact blueprint to the letter. No guessing, no opinions; it stops when the blueprint is ambiguous. |
| `task` | Research, consultation, and execution of a goal with a scope and acceptance criteria. It decides the how inside the scope and declares every decision. |
| `advisor` | Research and consultation only: opinions, proposals, critique. It never edits files; Claude implements. |

## Step 1: Determine the requested mode, model and effort

Arguments are case-insensitive and may come in any order, e.g. `/agy-worker task`, `/agy-worker task argon`, `/agy-worker strict flash medium`, `/agy-worker argon low`:
- **Mode**: `off`, `strict`, `task` or `advisor`.
- **Model family**: `argon` (Gemini 4 Argon) or `flash` (Gemini 3.8 Flash).
- **Effort**: `low`, `medium` or `high`.

Rules:
- Whatever the arguments name is used as given, without a question. A model or effort named in plain words anywhere in the user's message (e.g. "dùng Gemini 4 Argon", "argon medium", "flash low effort") counts the same as an argument.
- **A mode given**: apply it right away, with no question about the model or effort. The model family and effort named in the message are used; any that is not named falls back to the default (`flash` / `high`), not to the previous choice.
- **Only a model and/or effort given** (no mode): keep the current mode and change only the model/effort; a part not named falls back to the default (`flash` / `high`).
- **No argument at all, or `on`**: ask the user with one `AskUserQuestion` call holding these three questions, before doing anything else:
  1. "Which agy worker mode for this chat?" (header `Mode`)
     - `task`: give `agy` a goal, scope and acceptance criteria; it decides the how.
     - `strict`: give `agy` an exact blueprint; it follows it to the letter.
     - `advisor`: `agy` only reads and gives opinions; Claude implements.
     - `off`: never run `agy`; Claude does everything itself.
  2. "Which model for agy worker calls?" (header `Model`)
     - `Gemini 3.8 Flash (Recommended)`: faster and cheaper; the worker default.
     - `Gemini 4 Argon`: stronger reasoning for harder investigations and changes.
  3. "Which effort for that model?" (header `Effort`)
     - `high (Recommended)`, `medium`, `low`.

Do not guess the answers and do not carry on with other work until the mode, model and effort are known.

The worker model ID is `gemini-4-argon-<effort>` for `argon` and `gemini-3.8-flash-<effort>` for `flash` (check with `agy models` if a call reports an unknown model). Pass it as `--model <id>` on every non-UI `agy` call; never add a separate `--effort` flag.

## Step 2: Apply the mode

**strict, task, advisor**
1. Run `which agy`. If it is not found, tell the user, keep the mode `off`, and stop.
2. From now on the agy parts of `~/.claude/CLAUDE.md` are in force for that mode: what may be delegated, which contract and report template each call uses, the UI routing rule, and the review gate for every `agy` output.

**off**
1. Never run the `agy` command, for research, consultation or implementation. The only exception is UI work while the agy UI mode (`/agy-ui`, on by default) is on.
2. Do Mode B work yourself with native tools, any installed add-ons in `~/.claude/rules/`, and Claude subagents. Everything in CLAUDE.md that does not concern `agy` still applies.

## Step 3: Confirm and persist

- Confirm in one line: `agy worker: <mode> [model: <model id>]` (for this chat).
- The mode and model hold for every later turn of this conversation until the user invokes this skill again or explicitly says to change it. Do not drift to another mode after a few turns.
- If the conversation is summarized or compacted, carry the current mode and worker model into the summary.
- The mode never carries over to another chat: a new chat starts `off` with `gemini-3.8-flash-high`.
