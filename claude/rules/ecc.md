# Specialized Toolkits & On-Demand ECC Skill Selection

Optional add-on to `~/.claude/CLAUDE.md`, for setups with the ECC (Everything Claude Code) plugin installed. It applies whatever the agy worker mode is, including `off`.

For each task, Claude has access to the full ecosystem of **ECC (Everything Claude Code)** skills and specialized engineering playbooks. Claude has full discretion to evaluate the task and proactively select and apply the most suitable ECC skill:
- **Autonomous Skill Selection**: Assess the specific technical domain and complexity of the task (e.g., API design, system architecture, database migrations, security audit, testing, performance) and autonomously activate the relevant ECC skill (such as `api-design`, `hexagonal-architecture`, `db-migrations`, `gan-style-harness`, `agentic-engineering`, or `security-review`).
- **Playbook Application**: Incorporate the specialized patterns, edge-case checklists, and architectural best practices defined in the chosen skill into the execution plan and verification gates.
- **On-Demand & Lean Context**: Invoke skills modularly as needed rather than pre-loading unnecessary rules, keeping the active context window lean and laser-focused on the immediate task.
