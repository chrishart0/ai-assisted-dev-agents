---
name: auto-research
description: Autoresearch loop using plan → propose → test → score → keep/discard → repeat. Use this skill for deep research style tasks where a systematic process is needed over large amounts of research. Do not use this for research only needing 1-3 queries.
version: 1.0.0
---

# Autoresearch (Karpathy FS)

## Purpose

Run deep research using a strict iterative loop with persistent markdown state.

This is an optimization process, not note-taking.

---

## When to Use

Use this skill ONLY if:
- the task requires multiple research iterations
- correctness matters more than speed
- the answer cannot be trusted from a single pass

Do NOT use for:
- simple questions
- quick lookups
- brainstorming

---

## Core Loop

Repeat:

1. pick weakest topic
2. propose ONE improvement
3. apply change
4. score before and after
5. keep or discard
6. log iteration

---

## Execution Rules

Each iteration MUST include:
- iteration number
- topic
- one change only
- score before
- score after
- keep/discard decision

If any are missing, the iteration is invalid.

---

## Workspace

Create:
research/<slug>/
program.md
status.md
final.md
experiments.md
topics/
research/<slug>/
program.md
status.md
final.md
experiments.md
topics/