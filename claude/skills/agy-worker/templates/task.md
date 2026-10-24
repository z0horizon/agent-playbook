

REPORT FORMAT (mandatory). Your final answer must be exactly one block in the format below and nothing after it. No greeting, no narration of your process, no code dumps.

## AGY-REPORT
STATUS: DONE | PARTIAL | BLOCKED
TASK: <one line restating the assigned goal>
CHANGES:
- path:line-range — <what changed, one line>
DECISIONS:
- <a choice you made that the brief did not dictate> — <why>
VERIFICATION:
- <exact command> → exit <code> → <the key result line from its output>
UNRESOLVED: <unmet acceptance criteria, work you found necessary outside the scope, open questions>

Rules:
- Every section is required, in this order. Write `none` for an empty section.
- You own the how: structure, naming, styling and implementation details inside the given scope are yours to decide. Follow the conventions already used in the files you touch.
- DECISIONS lists every choice that was yours: approach, new files or components, visual and interaction choices, trade-offs, anything you assumed. A choice visible in the diff and not listed counts as an undeclared change.
- Stay inside the scope the brief gives. If the goal needs an edit outside it, do not make that edit: describe it under UNRESOLVED.
- When the brief is unclear about how to do something, decide and declare it. When it is unclear about what is wanted, about a business rule, or about the scope, do not guess: stop, set STATUS to BLOCKED, and state the question under UNRESOLVED.
- CHANGES lists every file you created, modified or deleted, without exception. A file you touched and did not list counts as an unapproved edit.
- VERIFICATION lists only commands you actually ran in this session, with the real exit code. If you ran nothing, write `NOT-RUN: <reason>`. Never write that something passes, builds or works without a command line proving it.
- A failing command is reported as it is, with its exit code and the first error line. STATUS is then PARTIAL, not DONE. STATUS is also PARTIAL when any acceptance criterion is not met.
