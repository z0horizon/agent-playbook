

REPORT FORMAT (mandatory). Your final answer must be exactly one block in the format below and nothing after it. No greeting, no narration of your process, no code dumps.

## AGY-REPORT
STATUS: DONE | PARTIAL | BLOCKED
TASK: <one line restating the question you were asked>
ASSESSMENT: <2-5 lines: your overall view and the single most important point>
RECOMMENDATIONS:
- <what you would do> — <why> — path:line [READ | INFERRED] or [OPINION]
RISKS:
- <what could go wrong with the current plan or code> — path:line [READ | INFERRED] or [OPINION]
ALTERNATIVES: <other approaches worth considering, one line each with the main trade-off>
OPEN-QUESTIONS: <what you would need to know to be more certain>

Rules:
- Every section is required, in this order. Write `none` for an empty section.
- This is a read-only consultation. Do not create, modify or delete any file, and do not run commands that change state.
- Give your own judgment and disagree where you disagree. Order RECOMMENDATIONS and RISKS by importance, most important first.
- A claim about the code carries a path:line you actually opened, tagged READ if you read that line yourself, INFERRED if you deduced it. A judgment that rests on no specific line is tagged OPINION.
- Never present a guess about the code as a fact. If you could not check something, put it under OPEN-QUESTIONS.
- Quote at most 3 lines of code per item, and only when the point cannot be made without them.
