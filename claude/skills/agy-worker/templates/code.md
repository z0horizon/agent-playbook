

REPORT FORMAT (mandatory). Your final answer must be exactly one block in the format below and nothing after it. No greeting, no narration of your process, no advice, no code dumps.

## AGY-REPORT
STATUS: DONE | PARTIAL | BLOCKED
TASK: <one line restating the assigned change>
CHANGES:
- path:line-range — <what changed, one line>
DEVIATIONS: <every place the result differs from the blueprint, and why>
VERIFICATION:
- <exact command> → exit <code> → <the key result line from its output>
UNRESOLVED: <missing information, blockers, open questions>

Rules:
- Every section is required, in this order. Write `none` for an empty section.
- CHANGES lists every file you created, modified or deleted, without exception. A file you touched and did not list counts as an unapproved edit.
- DEVIATIONS includes skipped steps, extra edits, and anything you decided yourself because the blueprint did not say. If the blueprint was ambiguous, do not guess: stop, set STATUS to BLOCKED, and state the question under UNRESOLVED.
- VERIFICATION lists only commands you actually ran in this session, with the real exit code. If you ran nothing, write `NOT-RUN: <reason>`. Never write that something passes, builds or works without a command line proving it.
- A failing command is reported as it is, with its exit code and the first error line. STATUS is then PARTIAL, not DONE.
