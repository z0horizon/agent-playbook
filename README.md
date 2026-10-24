# agent-playbook

How I combine Claude Code with other coding agents: the live config that drives it, and the notes on what works.

## Layout

| Path | What it is |
|------|------------|
| `claude/` | Mirrors `~/.claude/`. The files there are symlinks into this folder. |
| `claude/CLAUDE.md` | Global instructions: delegation protocol, complexity gating, review gate. |
| `claude/skills/agy-worker/` | `/agy-worker` skill: agy worker mode, model and report templates. |
| `claude/skills/agy-ui/` | `/agy-ui` skill: agy UI mode, model and brand preset. |
| `playbooks/<pairing>/` | Usage notes for one agent pairing. |
| `install.sh` | Links `claude/` into `~/.claude/`. |

## Install

```sh
git clone https://github.com/z0horizon/agent-playbook.git ~/Workspace/agent-playbook
cd ~/Workspace/agent-playbook
./install.sh --dry-run   # show what would change
./install.sh
```

Existing files in `~/.claude/` are moved to `~/.claude/.agent-playbook-backup/<timestamp>/` before being replaced. A target that is already a symlink to somewhere else is left alone and reported. Set `CLAUDE_HOME` to install somewhere other than `~/.claude`.

Because `~/.claude/` points into the repo, edits made there (by hand or by Claude mid-chat) show up in `git status` here. Commit them.

## Playbooks

- [claude-agy](playbooks/claude-agy/README.md): Claude Code as tech lead, Antigravity CLI (`agy`) as worker.

To add a pairing, create `playbooks/<pairing>/README.md`. If it needs config, put it under `claude/` and add the path to `ITEMS` in `install.sh`.
