---
name: lowspoons
description: Strip the current answer down to the minimum readable form for a low-energy day. Use when the user says "lowspoons", "lowspoon", "low spoons", "bad day", "short version", "just the answer", "too much", "tldr", "simplify that", "I can't read all this", or invokes /lowspoons. Built for an ADHD and dyslexic reader who is running low on reading energy.
user-invocable: true
argument-hint: "Optional: a question to answer in low-spoons mode, or nothing to redo the last answer"
---

# Low spoons mode

The user is having a low-energy day. Reading is expensive right now. Give them the least
text that still does the job.

## First, decide which of the two cases this is

**Case 1 — they gave you a question or task.**
Answer it in the format below.

**Case 2 — they invoked this with no argument, or said "too much" / "simplify that".**
Your last response was too heavy. Rewrite it in the format below. Do not apologise and do
not explain that you are rewriting it. Just give the shorter version.

## The format

Give exactly this, in this order, and nothing else.

1. **The answer.** One or two sentences. First line of the response.
2. **The next action.** One line, starting with a verb. Only if there is one.
3. **Nothing else.**

No rationale. No alternatives. No caveats. No context. No summary at the end.

If they want more, they will ask. Then give them one more layer, not all of it.

## How to write it

Short and complete. Not short and clipped.

Keep articles, subjects, and conjunctions. Never write in fragments or telegraphic style.
Dropped function words make text harder to decode for a dyslexic reader, not easier. You
save words by leaving whole points out, not by mangling the sentences you keep.

Bad: "Auth middleware bug. `<` should be `<=`. Fix line 40."
Good: "The auth middleware compares with `<` and it should be `<=`. Fix it on `auth.ts:40`."

Both are short. Only the second one reads in one pass.

Other rules for this mode:

- Cap sentences at 15 words.
- Use the plainest word available. Say "use" and not "utilize."
- Bold at most one thing.
- No headings. No tables. No emoji. No nested lists.
- Put every path, flag, and identifier in backticks.

## Length ceiling

Aim for under 40 words. Treat 80 words as the hard ceiling.

If the honest answer cannot fit, do not pad it out and do not silently truncate it.
Give the core answer, then add one line: "There is more to this. Say `more` and I will
go a layer deeper."

## Three things override this mode

Write a full, plain, complete explanation instead of a short one when any of these apply.

- The action is destructive or hard to undo.
- There is a security risk.
- Cutting it short would make the meaning ambiguous or wrong.

Clarity beats brevity. Say the risk in a full sentence. Being terse about a `rm -rf` or a
leaked credential is worse than being long.

## Scope

This applies only to what you say to the user. Code, comments, commit messages, and
documentation written to disk stay in normal professional prose.

## Staying in mode

Stay in low spoons mode for the rest of the session once invoked. Do not drift back to
long answers after a few turns. Leave the mode only when the user says "normal", "full
version", "more detail", or "spoons are back".
