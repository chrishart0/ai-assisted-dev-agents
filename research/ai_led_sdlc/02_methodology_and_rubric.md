
# Methodology and Scoring Rubric
## How the AI-led SDLC study was normalized and compared

This companion file explains how the landscape study was executed and how each workflow or method was compared.

## 1. Study design

The study was designed as a **comparative workflow meta-study**, not a product review and not a conventional literature review.

That distinction matters:

- A product review would emphasize features, pricing, or vendor differentiation.
- A literature review would prioritize academic completeness and theory.
- A workflow meta-study emphasizes **how work actually flows**, where AI participates, what artifacts exist, what decisions remain human, and how control is maintained.

The practical question was:

> When current high-signal enterprise workflows and public methods are normalized into the same frame, what process shape appears most often?

## 2. Normalization frame

Each workflow or method was mapped against the same dimensions.

| Dimension | What question it answers | Example evidence |
|---|---|---|
| Entry point | How does work begin? | Business request, issue, incident, spec, prompt, PRD |
| Context formation | How is durable context created? | Rules, constitution, repo instructions, AGENTS files, project-context, PRD, architecture |
| Planning model | How is work decomposed? | Clarifying questions, plans, tasks, stories, flows |
| Execution model | How does AI participate? | Pair programming, background coding agent, multi-agent flow, PR/MR automation |
| Validation model | How is quality checked? | Tests, code review, evals, scans, human review |
| Release model | How is production change controlled? | Deterministic CI/CD, approvals, branch protections, gates |
| Runtime feedback loop | How does ops re-enter engineering? | Monitoring, incident-created issues, optimization loops, SRE agents |
| Governance model | How is AI use controlled? | Policies, model restrictions, audit logs, roles, content boundaries |
| Adaptivity | Does rigor vary with work type? | Conditional stages, multiple tracks, optional depth |
| Artifact depth | How many persistent artifacts are produced? | Lightweight, medium, heavy |

## 3. Coding classes

After normalization, recurring patterns were coded into four classes.

### Universal
Appears in nearly every serious workflow in the corpus.

### Common
Appears often, but not in all workflows.

### Differentiating
Appears in some workflows and helps distinguish one family from another.

### Emerging
Shows up in recent workflows and appears strategically important, but is not yet stable across the corpus.

## 4. What was compared qualitatively

The study did **not** assign hard numeric scores because the field is too early and because most sources are different in kind. Instead, the comparison used consistent descriptive ratings such as:

- low / medium / high
- weak / medium / strong
- lightweight / medium / heavy
- fixed / moderately adaptive / strongly adaptive

This approach avoids false precision while still making comparisons operationally useful.

## 5. Key analytical questions used for each source

For each framework, the study asked:

1. What is the first-class unit of work?
2. How is intent clarified before coding starts?
3. What artifacts persist beyond a single chat session?
4. What is the execution unit: task, story, issue, PR/MR, flow, incident?
5. What can the agent do independently?
6. What must a human approve?
7. What checks exist before merge or release?
8. Is release deterministic?
9. Does runtime evidence create new work?
10. Is the method fixed or adaptive?
11. Where do governance and auditability actually live?

These questions are what allowed the study to separate, for example, a planning method from a repository automation pattern or a governance surface from a full lifecycle model.

## 6. Why this rubric matters

Without a normalization rubric, “AI-led SDLC” becomes a catch-all label for very different things:

- a planning framework,
- a coding-agent workflow,
- a governance console,
- a DevSecOps automation layer,
- or an engineering operating philosophy.

The rubric forces those things into comparable categories and makes it possible to identify the actual common path.

## 7. Practical interpretation guide

When using the comparison outputs in workshops or leadership reviews, the most useful reading order is:

1. **Lifecycle breadth** — how much of the lifecycle is explicitly covered?
2. **Artifact depth** — how much durable context is produced?
3. **Governance explicitness** — how concrete are the controls?
4. **Ops-loop strength** — does the workflow meaningfully close the loop after release?
5. **Adaptivity** — can the process scale depth with risk and ambiguity?

That sequence surfaces the most important strategic trade-offs faster than reading each source in isolation.

## 8. What the rubric revealed

The rubric made five things especially visible:

- **Intent-to-context conversion** is more important than most teams initially expect.
- **PR/MR boundaries** are becoming the dominant human-accountability checkpoint.
- **Release determinism** is a major area of convergence across enterprise patterns.
- **Ops feedback loops** separate mature lifecycle patterns from coding-only patterns.
- **Adaptive depth** is emerging as one of the clearest markers of process maturity.

## 9. Limits of the method

This rubric is designed for workflow comparison, not for proving business impact. It can identify structural maturity and control design, but it cannot by itself prove which framework leads to the best engineering outcomes in a specific organization. Those results will depend on culture, tooling, codebase condition, and adoption discipline.

That said, the rubric is strong enough to support the main goal of the study: synthesizing a **defensible common process** and identifying where the top approaches actually differ.
