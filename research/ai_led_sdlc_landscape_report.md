# AI-led SDLC landscape report (working draft)

## Executive conclusion

Across the strongest published enterprise workflows and the clearest public methods, the center of gravity is not “AI writes code faster.” It is:

**Intent -> Structured context -> Plan/design -> Agentic execution -> Layered validation -> Deterministic release -> Runtime observation -> Replanning**

The methods differ mostly in how much structure they put before coding, how much autonomy they give agents, and how formal they are about governance and operations.

## Core corpus used

Enterprise / first-party:
- AWS AI-DLC and adaptive workflow material
- Microsoft AI-led SDLC and internal AI-led engineering material
- GitHub enterprise agentic SDLC docs, coding agent, code review, MCP, AI managers
- GitLab Duo Agent Platform and its planner/dev/review/CI flows
- OpenAI AI-native engineering and harness engineering guidance

Public / open methods:
- GitHub Spec Kit
- BMAD Method

Supporting interpretation:
- DORA 2025 AI-assisted software development
- Thoughtworks on spec-driven development

## Landscape: three major families

1. **Enterprise orchestration models**
   - AWS, Microsoft, OpenAI
   - Emphasis: end-to-end lifecycle, human oversight, auditability, runtime loop

2. **Platform-centric delivery flows**
   - GitHub, GitLab
   - Emphasis: PR/MR-centered execution, review, security, platform controls, developer workflow integration

3. **Context/spec-first public methods**
   - Spec Kit, BMAD
   - Emphasis: turning intent into durable artifacts, progressive context building, decomposition before implementation

## What each method contributes

### AWS AI-DLC
Most explicit adaptive enterprise lifecycle.
- Three phases: inception, construction, operations
- AI asks clarifying questions, proposes plans, waits for approval
- Workflow depth adapts to task complexity
- Persistent context and audit trail are first-class

### Microsoft AI-led SDLC
Clearest end-to-end chain of specialized agents.
- Problem statement -> Spec Kit -> coding agent -> quality agent -> deterministic CI/CD -> SRE agent
- Strongest explicit claim that deploy/build should remain deterministic
- Good model for enterprise operating loop after release

### GitHub enterprise agentic SDLC
Richest PR-centric developer workflow.
- Plan, prototype, create, test, review, optimize, secure
- Coding agent works in background and opens PRs
- Code review, security autofix, MCP, AI managers add governance and scale controls

### GitLab Duo Agent Platform
Strong multi-agent platform framing.
- Planner agent, software development flow, developer flow, code review flow, CI/CD fix flow
- Async collaboration across SDLC
- Good treatment of service accounts and segregation of duties

### OpenAI AI-native engineering
Best operating principle.
- Delegate / Review / Own across plan, design, build, test, review, document, deploy and maintain
- Strong focus on environment design, project memory, and structured tool use
- Useful for role design and operating model

### GitHub Spec Kit
Best open spec-to-task pipeline.
- Constitution -> specify -> plan -> tasks -> implement
- Makes specs executable and creates clear phase gates

### BMAD
Deepest public context-engineering/planning method.
- Analysis, planning, solutioning, implementation
- Multiple depth tracks from quick to enterprise
- Very strong on progressive context and artifact creation before execution

## Common buckets across the landscape

1. **Frame the work**
   - start from business problem, issue, or request

2. **Clarify and bound**
   - surface ambiguity, risks, assumptions, acceptance criteria

3. **Create durable context**
   - specs, PRDs, architecture notes, repo rules, AGENTS/context files, task structures

4. **Plan and decompose**
   - convert intent into stories, tasks, plans, branches of work, or PR-ready units

5. **Execute with agents**
   - generate code, tests, docs, fixes, plans, and routine changes

6. **Validate and govern**
   - tests, review, security, evals, policy checks, human checkpoints

7. **Release deterministically**
   - CI/CD, approvals, branch protections, environment promotion

8. **Operate and learn**
   - monitor production, investigate issues, create new work items, feed back into planning

## One normalized AI-led SDLC

1. Intake the request  
2. Clarify intent and constraints  
3. Encode context in durable artifacts  
4. Create a technical plan and break it into executable units  
5. Let agents do the first-pass execution  
6. Run layered validation and human review  
7. Ship through deterministic delivery controls  
8. Observe runtime behavior and feed findings back into the backlog/spec

## Main fault lines between methods

### Adaptive vs fixed depth
AWS and BMAD are the clearest examples of variable rigor based on project complexity.

### Artifact-heavy vs workflow-heavy
BMAD and Spec Kit are artifact-first.
GitHub and GitLab are more execution-flow-first.

### Execution locus
Some methods work mainly in repo/PR/MR systems.
Others start in structured spec generation and hand off later.

### Governance maturity
Enterprise methods increasingly add policy files, agent instructions, audit logs, service accounts, MCP controls, and explicit human gates.

### Operations maturity
Microsoft, AWS, OpenAI, and GitLab make the post-release loop more explicit than most public methods.

## Final synthesis

The strongest synthesis is:

**AI-led SDLC is a software delivery model where AI participates across planning, design, implementation, validation, release support, and operations, while humans retain judgment and approval authority and deterministic systems enforce the final quality and release controls.**

That is the common path through the serious methods now.
