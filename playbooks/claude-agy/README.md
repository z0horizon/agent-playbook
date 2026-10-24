# Claude + agy

Claude Code plans, reviews and owns the result. Antigravity CLI (`agy`) does delegated research and implementation. The rules live in [`claude/CLAUDE.md`](../../claude/CLAUDE.md); this page is the short version plus what I learned using it.

## Choosing a mode

Two independent switches, both scoped to one chat.

**Worker mode** (`/agy-worker`, default `off`, model `gemini-3.8-flash-high`) covers non-UI work:

| Mode | agy does | Use when |
|------|----------|----------|
| `off` | nothing | Small or delicate work; you want Claude only. |
| `strict` | research + exact blueprints, to the letter | The change is well understood and must be precise (protocols, public interfaces, migrations). |
| `task` | research + consultation + goal/scope/acceptance tasks | Medium-to-large work where agy can decide the how. |
| `advisor` | research + opinions, never edits | You want a second view but Claude should write the code. |

**UI mode** (`/agy-ui`, default `on`, model `gemini-4-argon-high`) sends UI/UX work to agy under the task contract, with a Design Brief Claude builds once per chat. With the `design-md` add-on, `/agy-ui <brand>` pins a brand reference from `~/.agents/design-md/`.

## Invoking the skills

Arguments are case-insensitive, in any order:

```
/agy-worker                    # asks mode, model, effort
/agy-worker task               # task mode, default model (flash/high), no question
/agy-worker strict argon       # strict mode, gemini-4-argon-high
/agy-worker flash low          # keep mode, change model only
/agy-ui off
/agy-ui linear argon medium    # UI on, Linear brand, gemini-4-argon-medium
```

A model named in plain words ("use Gemini 4 Argon") counts as an argument. Anything not named falls back to the default, not to the previous choice.

## Lessons

- **Re-check every agy claim yourself.** Its counts and conclusions have been wrong before. A report is a claim; `path:line` spot checks and re-running its `VERIFICATION` commands are the evidence.
- **Diff before you read the report.** Compare `CHANGES` with `git status --short` and `git diff --stat` first; an unlisted file is an unapproved edit.
- **Re-verify rejections too.** When you reject or correct an agy finding, confirm the correction against the code, not against a second agy answer.
- **Don't delegate small things.** Prompt drafting and review cost more than a one-file edit; keep those inline.

## Adding a note

```markdown
### <short title> (YYYY-MM-DD)
- **Situation**: what the task was, which mode and model.
- **What I did**: the prompt shape or workflow.
- **Result**: what worked, what agy got wrong.
- **Lesson**: the rule to keep.
```
