
# Comparison Matrix
## Top enterprise workflows and public methods for AI-led SDLC

This matrix is intentionally comparative rather than exhaustive. The goal is to show where the current high-signal methods line up, where they differ, and what each is best used for.

## 1. Compact profile matrix

| Framework | Category | Lifecycle breadth | Artifact depth | Governance explicitness | Ops-loop strength | Adaptivity | Best interpreted as |
|---|---|---:|---:|---:|---:|---:|---|
| AWS AI-DLC | Enterprise orchestration | High | High | Medium-High | High | High | Adaptive house-method blueprint |
| Microsoft AI-led SDLC | Enterprise orchestration | High | Medium | Medium | High | Medium | Composite lifecycle reference architecture |
| GitHub enterprise workflow | Platform-native execution | High | Medium | Very High | Medium-High | Medium | PR-centric execution and control model |
| GitLab Duo Agent Platform | Platform-native orchestration | High | Medium | High | High | Medium | Flow-centric DevSecOps orchestration layer |
| OpenAI AI-native engineering | Operating model guidance | High | Medium | Medium | High | Medium | Human/agent operating philosophy with practical artifacts |
| GitHub Spec Kit | Public context-first method | Medium | Very High | Low-Medium | Medium-Low | Medium | Front-end method for executable specs and planning |
| BMAD Method | Public context-first method | Medium-High | Very High | Medium | Medium | Very High | Adaptive planning and solutioning method |

## 2. Execution and control matrix

| Framework | First-class unit of work | Common durable artifacts | Main execution boundary | Human approval boundary | Release stance |
|---|---|---|---|---|---|
| AWS AI-DLC | Problem statement / workflow stage | Rules, plans, audit artifacts, generated docs | Workflow stages and generated implementation work | Phase transitions and critical decisions | Governed; human oversight emphasized |
| Microsoft AI-led SDLC | Spec / task sequence | Spec, plan, tasks, quality outputs, incident follow-up | Coding-agent tasks and workflow stages | Review, deterministic CI/CD, ops decisions | Explicitly deterministic |
| GitHub enterprise workflow | Issue / pull request | Spaces, custom instructions, PR evidence | Pull request / review loop | PR review and merge | Governed via branch protections and approvals |
| GitLab Duo Agent Platform | Issue / merge request / flow trigger | Flow definitions, MR evidence, pipeline outputs | Flow execution and merge request | MR review, policy, and pipeline controls | Governed under organizational rules |
| OpenAI AI-native engineering | Task / plan / repository workflow | AGENTS.md, PLAN.md, workflow docs, shared memory | Agent task or long-horizon work package | Human owns architectural and production decisions | Human sign-off; deterministic systems preferred |
| Spec Kit | Specification / task | Constitution, spec, plan, tasks | Implementation pass against task artifacts | Human validates each phase before moving on | External to core method |
| BMAD Method | Product brief / PRD / story | Product brief, PRD, UX spec, architecture, project-context, stories | Story or implementation workflow | Human approval in planning and review | External to core public method |

## 3. Distinctive strengths

| Framework | Strongest contribution |
|---|---|
| AWS AI-DLC | Adaptive rigor and workflow-as-control-plane |
| Microsoft AI-led SDLC | Chained lifecycle breadth from spec through operations |
| GitHub enterprise workflow | PR-centric agent execution with strong governance |
| GitLab Duo Agent Platform | Multi-agent flows and event-driven DevSecOps orchestration |
| OpenAI AI-native engineering | Clear human/agent role model and lightweight durable artifacts |
| Spec Kit | Executable specifications and explicit artifact chain |
| BMAD Method | Planning + solutioning + adaptive project-context discipline |

## 4. Major limitations or gaps

| Framework | Main limitation in isolation |
|---|---|
| AWS AI-DLC | Less concrete than GitHub/GitLab on repository-native day-to-day PR/MR choreography |
| Microsoft AI-led SDLC | Composite and illustrative rather than a single unified productized workflow |
| GitHub enterprise workflow | Upstream planning and architecture discipline depends on external methods or internal standards |
| GitLab Duo Agent Platform | Same upstream-method dependency; can accelerate weak framing as effectively as strong framing |
| OpenAI AI-native engineering | Strong philosophy and practices, but not a single prescriptive enterprise method |
| Spec Kit | Limited enterprise governance and operations guidance on its own |
| BMAD Method | Limited formal enterprise control-plane and release-governance surface on its own |

## 5. Synthesis view

The comparison points to a composite reference approach:

- Use **Spec Kit/BMAD-like artifacts** to structure intent and create durable context.
- Use **GitHub/GitLab-like execution surfaces** to manage agentic work inside PR/MR and platform controls.
- Use **AWS/Microsoft/OpenAI-like lifecycle breadth** to ensure the process extends beyond coding into validation, release support, and operations.
- Use **Foundry/NIST-like governance overlays** where agent tracing, evaluation, identity, and secure-development controls matter.

That synthesis is what informed the generalized process in the main report.
