
# Enterprise Reference Model
## AI-led SDLC v1

This file is the compact operational version of the landscape study.

## Core principle

An enterprise AI-led SDLC should be:

- **method-heavy on the left**,
- **platform-heavy in the middle**,
- **operations-heavy on the right**,
- **governed throughout**. [S1][S4][S5][S10][S11][S14]

## Normalized lifecycle

1. **Frame the request**  
   Define the problem, user value, incident, or change request.

2. **Clarify and bound**  
   Surface ambiguities, constraints, risks, and acceptance criteria.

3. **Build the context pack**  
   Create durable instructions, principles, specs, architecture notes, and references.

4. **Plan and decompose**  
   Produce tasks, stories, or flow definitions small enough to execute and verify.

5. **Execute with agents**  
   Let agents perform first-pass implementation, testing, documentation, analysis, or remediation.

6. **Validate and govern**  
   Run tests, scans, code review, evaluation loops, and human oversight.

7. **Release deterministically**  
   Use standard CI/CD, approvals, and environment controls.

8. **Operate and replan**  
   Feed telemetry, incidents, and quality signals back into new work. [S1][S2][S4][S10][S11]

## Minimum required artifacts

- Intake artifact
- Context pack
- Execution plan
- Change evidence
- Release evidence
- Operations note

## Decision gates

- G0: intake accepted
- G1: context approved
- G2: plan approved
- G3: change reviewed
- G4: release approved
- G5: learnings captured

## Role categories

- Request owner
- Context owner
- Executing agent
- Reviewer
- Platform and governance owner
- Operations owner

## Non-negotiable design rules

1. **No agentic execution without durable context.**
2. **No production change without deterministic controls.**
3. **No meaningful AI adoption without a visible control plane.**
4. **No closed-loop claim unless runtime feedback creates new work.**
5. **No single fixed process depth for every task.** [S1][S3][S5][S9][S10][S14]

## Practical implementation sequence

### Phase 1
Introduce instructions files, plan templates, and a PR/MR review standard.

### Phase 2
Create an AI governance role or equivalent ownership model and define repository/project policy.

### Phase 3
Connect agentic execution to platform-native controls and evidence capture.

### Phase 4
Add operational feedback loops that create follow-up work and improve the context pack.

## Metrics that matter

- Time to first acceptable plan
- Time from issue to validated PR/MR
- First-pass review acceptance rate for agent-authored work
- Escaped defect rate
- Incident time-to-diagnosis
- Reduction in repetitive operational work
- Reuse rate of context artifacts [S3]

## What this model is trying to solve

This model is intended to prevent two common failure modes:

- speeding up coding while leaving planning, review, and operations as bottlenecks;
- spreading agents faster than governance, standards, and evidence practices can keep up.

It is deliberately conservative where risk is high and deliberately aggressive where repetitive work can be safely delegated.
