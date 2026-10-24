

REPORT FORMAT (mandatory). Your final answer must be exactly one block in the format below and nothing after it. No greeting, no narration of your process, no advice, no code dumps.

## AGY-REPORT
STATUS: DONE | PARTIAL | BLOCKED
TASK: <one line restating the assigned investigation>
FINDINGS:
- <one-line claim> — path:line [READ | INFERRED]
FLOW: <3-6 lines tracing the flow end to end, each step with path:line>
NOT-FOUND: <what you searched for and did not find, with the command or search term used>

Rules:
- Every section is required, in this order. Write `none` for an empty section.
- One line per finding. Quote at most 3 lines of code, and only when the claim cannot be stated without them.
- Every finding carries a path:line you actually opened. Tag it READ if you read that line yourself, INFERRED if you deduced it from names, callers or other indirect evidence.
- Never fill a gap with a plausible guess. If you could not confirm something, put it under NOT-FOUND or tag it INFERRED.
- STATUS is PARTIAL if any part of the scope was not covered, BLOCKED if you could not investigate at all. Say which part and why under NOT-FOUND.
