# CodeGraph CLI (Structural Graph & Call Paths)

Optional add-on to the exploration rules in `~/.claude/CLAUDE.md` section 1. Use it for Mode A lookups, Mode B investigations, and the section 3 checks that `agy`'s cited paths and symbols exist.

Available when BOTH conditions are met:
1. Directory `.codegraph/` exists at the repository root.
2. `which codegraph` is available on the system.

- **Pre-task inspection & sync**:
  - Run `codegraph sync` to sync index changes.
  - Run `codegraph help` to inspect available commands, flags, and capabilities.
- **Structural exploration**:
  - Use `codegraph explore "<symbol or question>"` for instant graph mapping (definitions, callers, callees, dependency blast radius).
*(DO NOT use CodeGraph MCP tools, only use the CLI).*

## Combining with agy workers
- **Flexible Tool Selection**: Use CodeGraph alone, deploy `agy` workers alone, or combine them in whichever sequence or pattern best fits the context of the problem and codebase.
- **Adaptive Workflow**: For instance, use CodeGraph to instantly trace symbols and call hierarchies then dispatch `agy` workers to inspect deep implementation logic, or conversely run broad `agy` sweeps first and then drill down with CodeGraph or native tools.
- CodeGraph usage still applies when the agy worker mode is `off`.
