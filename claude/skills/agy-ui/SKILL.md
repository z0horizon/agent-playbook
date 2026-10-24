---
name: agy-ui
description: Session-scoped switch, brand-preset selector and model/effort selector (Gemini 4 Argon or Gemini 3.8 Flash; low, medium, high) for agy (Antigravity CLI) UI & UX delegation in ~/.claude/CLAUDE.md (default: ON, gemini-4-argon-high).
disable-model-invocation: true
---

# agy UI Mode & Design Pipeline

Session-scoped ON/OFF switch (and optional brand-design preset selector) for the agy UI mode defined in `~/.claude/CLAUDE.md` (§0 "agy UI Mode", §2 "UI Delegation & Design Pipeline", and §3 UI review gate). Default for every chat is **ON** with the UI model `gemini-4-argon-high`: UI and UX work goes to `agy` unless turned off here.

Independent of `/agy-worker` (which governs non-UI work).

## Step 1: Determine the requested state, brand preset, model and effort

Arguments are case-insensitive and may come in any order, e.g. `/agy-ui off`, `/agy-ui linear`, `/agy-ui on flash`, `/agy-ui stripe argon medium`, `/agy-ui flash low`:
- **State**: `on` or `off`.
- **Model family**: `argon` (Gemini 4 Argon) or `flash` (Gemini 3.8 Flash).
- **Effort**: `low`, `medium` or `high`.
- **Brand**: any other word is a brand name (e.g. `linear`, `stripe`, `vercel`, `apple`). Brand presets come from the `design-md` add-on (`~/.claude/rules/design-md.md`); if `~/.agents/design-md/` does not exist, tell the user presets need that add-on and ignore the word. Otherwise check `~/.agents/design-md/<brand>/DESIGN.md`. If found, set state to **ON** and pin that brand's `DESIGN.md` as the session's active Brand Reference. If not found, list the closest matches from `ls ~/.agents/design-md/` and ask the user to pick one.

Rules:
- Whatever the arguments name is used as given, without a question. A model or effort named in plain words anywhere in the user's message (e.g. "dùng Gemini 3.8 Flash", "argon medium", "flash low effort") counts the same as an argument; words that only describe the model or the request are not brand names.
- **A state or brand given**: apply it right away, with no question about the model or effort. The model family and effort named in the message are used; any that is not named falls back to the default (`argon` / `high`), not to the previous choice.
- **A model or effort given without a state**: the state becomes ON; a part not named falls back to the default (`argon` / `high`).
- **No argument at all**: ask the user with one `AskUserQuestion` call holding these three questions, before doing anything else:
  1. "Delegate UI/UX work to agy in this chat?" (header `UI mode`)
     - `ON`: UI/UX work goes to `agy` under the task contract with the Design Brief; Claude sets the scope and audits the result.
     - `OFF`: Claude implements UI/UX work itself with the same Design Brief rules, unless `/agy-worker` says otherwise.
  2. "Which model for agy UI work?" (header `Model`)
     - `Gemini 4 Argon (Recommended)`: stronger design and layout reasoning; the UI default.
     - `Gemini 3.8 Flash`: faster and cheaper, for small UI changes.
  3. "Which effort for that model?" (header `Effort`)
     - `high (Recommended)`, `medium`, `low`.
  If the answer is `OFF`, ignore the model and effort answers but keep them as the UI model for a later `/agy-ui on`.

Do not guess the answers and do not carry on with other work until the state, model and effort are known.

The UI model ID is `gemini-4-argon-<effort>` for `argon` and `gemini-3.8-flash-<effort>` for `flash` (check with `agy models` if a call reports an unknown model). Pass it as `--model <id>` on every `agy` call made for UI work under this mode; never add a separate `--effort` flag. Non-UI calls use the worker model from `/agy-worker`.

## Step 2: Apply the state & UI/UX toolkit

**ON**
1. Run `which agy`. If it is not found, tell the user, treat the state as OFF, and stop.
2. "UI Delegation & Design Pipeline" in `~/.claude/CLAUDE.md` §2 is in force. That section is the single definition of the pipeline; follow it there rather than from memory of this skill:
   - the Design Brief (build once and reuse, scaled to the task, with its precedence order),
   - the hand-off to `agy` under the task contract (`~/.claude/skills/agy-worker/templates/task.md`), with the brief marked authoritative,
   - the §3 review gate for every `agy` UI output.
3. A brand pinned in Step 1 is the "brand reference" in that precedence order: it ranks below the project's existing design and above the other design add-ons and Claude's own choices.

**OFF**
1. Do not send UI work to `agy` under the UI rule; handle it yourself (or via `/agy-worker` if active).
2. Whoever implements the UI work still follows the Design Brief rules in `~/.claude/CLAUDE.md` §2 (reuse, scaling, precedence) and the same state-completeness and accessibility checks.

## Step 3: Confirm and persist

- Confirm in one line: `agy UI: ON [model: <model id>]` (or `agy UI: ON [model: <model id>] [brand: <brand>]`) or `agy UI: OFF` (for this chat).
- The state, the UI model and any pinned brand preset hold for every later turn of this conversation until the user invokes `/agy-ui` again or explicitly changes it.
- If the conversation is summarized or compacted, carry the current state, UI model and pinned brand into the summary.
- The state never carries over to another chat: a new chat starts `ON` with `gemini-4-argon-high`.
