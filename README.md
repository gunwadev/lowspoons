# lowspoons

Low-drain output for Claude Code. Built for an ADHD and dyslexic reader.

The idea is simple. Reading costs energy, and some days you have less of it. So this gives
Claude two gears instead of one fixed style.

| Gear | What it is | When it runs |
|---|---|---|
| `plain` | The always-on baseline. Answer first, short complete sentences, small chunks. | Every turn, once enabled. |
| `/lowspoons` | The low gear. Answer plus next action, under 40 words, nothing else. | On demand, when you ask for it. |

`plain` is the floor you always get. `lowspoons` is what you reach for on a bad day.

## Install

```
git clone https://github.com/gunwadev/lowspoons.git
cd lowspoons
```

Windows (PowerShell):

```
./install.ps1
```

macOS or Linux:

```
bash install.sh
```

The installer copies two files into `~/.claude/`. It does not touch your settings, your
projects, or anything else.

Then enable the baseline gear:

```
/output-style plain
```

Output styles are baked into the system prompt at session start. So it takes effect on
your next session, or after you run `/clear`.

## Using the low gear

Three ways in:

- `/lowspoons` on its own — rewrites the last answer shorter.
- `/lowspoons why is the build failing` — answers in that mode from the start.
- Plain language — "low spoons today", "too much", "just the answer", "bad day".

Once you are in it, it stays for the session. Say "normal", "full version", or "spoons are
back" to leave.

If an answer genuinely will not fit in 40 words, it gives you the core and offers a
deeper layer rather than padding or silently cutting something out. Say `more` to get it.

## Why not the caveman skill

The popular caveman skill saves tokens by dropping articles, conjunctions, and subjects.
It turns sentences into fragments.

That is the wrong trade for a dyslexic reader. Function words are the scaffolding used to
decode a sentence. Removing them cuts the word count but raises the reading cost.

This project does the opposite. Brevity comes from cutting what gets included, never from
compressing the grammar.

```
Caveman:  Bug in auth middleware. Token check use < not <=. Fix:
lowspoons: The bug is in the auth middleware. The token check uses `<` and it
           should use `<=`.
```

Both are short. Only the second one reads in a single pass.

This also matches Anthropic's own model guidance, which says to keep output short by
being selective about what you include, not by compressing writing into fragments,
abbreviations, or arrow chains.

## Why two files instead of one

They use different mechanisms, and only one of them is durable.

- An **output style** edits the system prompt. It applies on every turn and cannot drift.
  Correct for "always write this way." That is `plain`.
- A **skill** is injected once when invoked. It is correct for "do this thing now," but it
  fades over a long session. That is `lowspoons`.

So the baseline rules live in the output style, where they hold. The on-demand gear lives
in the skill, where being invoked is the whole point.

## What it is based on

Rules were drawn from research on adult ADHD and adult dyslexia, not from preference.

- **British Dyslexia Association Style Guide** — sentence length, lists over prose, left
  alignment, no italics.
- **W3C COGA, Making Content Usable for People with Cognitive and Learning Disabilities**
  — one idea per sentence, one instruction per step, chunking long identifiers, no
  metaphor, adapt to the user rather than making the user adapt.
- **Working memory research in adult ADHD** — capacity sits near 3 to 4 chunks, which sets
  the list length and nesting limits.
- **BLUF, bottom line up front** — the answer goes in the first sentence, because the
  middle of a block is where recall is weakest.
- **Decision paralysis research in ADHD** — give one recommendation, not three equal
  options.
- **Spoon theory as applied to ADHD** — capacity varies day to day. This is the reason
  there are two gears rather than one fixed style, and the reason the low gear is
  something you choose rather than something guessed at for you.
- **Federal Plain Language Guidelines** — active voice, short common words, verbs instead
  of noun phrases.

## Safety carve-out

Both gears stop compressing when compression would be dangerous. Full plain sentences are
used when an action is destructive or hard to undo, when there is a security risk, or when
being short would make the meaning ambiguous.

Clarity beats brevity. Being terse about an `rm -rf` is worse than being long.

## Scope

This governs chat responses only. Code, code comments, commit messages, pull request text,
and project documentation stay in normal professional prose.

## Layout

```
output-styles/plain.md        the always-on baseline
skills/lowspoons/SKILL.md     the low gear
install.ps1                   Windows installer
install.sh                    macOS and Linux installer
```

Both files are plain markdown. Edit them freely. Nothing is generated and nothing is
compiled.

## Uninstall

```
rm ~/.claude/output-styles/plain.md
rm -r ~/.claude/skills/lowspoons
```

Then run `/output-style default`.

## Licence

MIT. See `LICENSE`.
