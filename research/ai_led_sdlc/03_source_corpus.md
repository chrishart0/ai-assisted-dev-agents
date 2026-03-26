
# Source Corpus
## AI-Led SDLC landscape study

This file records the primary source corpus used in the study. The report intentionally prioritizes first-party documentation, engineering blogs, and official repositories that define workflows, lifecycle steps, artifacts, or governance mechanisms. Thin marketing pages, generic opinion pieces, and unstructured AI-for-developers content were excluded.

## Inclusion criteria

A source was included if it did at least one of the following:

1. described a workflow spanning multiple SDLC phases;
2. defined durable artifacts, stages, or control points;
3. explained how AI participates beyond code generation;
4. explained governance, approval, evaluation, or monitoring boundaries; or
5. represented a reusable public method rather than a one-off demo.

## Primary corpus

| ID | Publisher | Source | Why selected |
|---|---|---|---|
| S1 | AWS | AI-Driven Development Life Cycle overview; adaptive workflow post; implementation walkthrough; Amazon Q project-rules docs | Strongest enterprise method-level definition of AI-led SDLC, especially on adaptive depth, rules, and human oversight. |
| S2 | Microsoft | “An AI led SDLC: Building an End-to-End Agentic Software Development Lifecycle with Azure and GitHub” | Strongest public chained example linking spec-driven development, coding agents, review, deterministic CI/CD, and SRE feedback. |
| S3 | Microsoft | “Powering the new age of AI-led engineering in IT at Microsoft” | Strongest enterprise change-management and operating-model companion to S2. |
| S4 | GitHub | “Integrating agentic AI into your enterprise’s software development lifecycle” | Strongest platform-level example of AI participation across planning, prototyping, implementation, testing, review, optimization, and security. |
| S5 | GitHub | “About GitHub Copilot coding agent” | Most concrete documentation on PR-centric agentic execution and its boundaries. |
| S6 | GitHub | “Establishing AI managers in your enterprise” and related enterprise management docs | Strong governance and enterprise role model for AI controls. |
| S7 | GitHub | Repository custom instructions and content-exclusion docs | Strong context and governance surface for repository-specific AI behavior. |
| S8 | GitHub | Spec Kit repo and GitHub blog introducing spec-driven development with AI | Strongest public/open front-end method for executable specs and context-heavy planning. |
| S9 | BMAD | Workflow map, project-context docs, “Why Solutioning Matters,” getting started | Strongest public method for progressive context engineering, adaptive rigor, and explicit solutioning. |
| S10 | GitLab | Duo Agent Platform pages and blogs | Strong platform-native orchestration model centered on agents, flows, merge requests, CI/CD, and governance. |
| S11 | OpenAI | “Building an AI-Native Engineering Team” plus Codex guidance on AGENTS.md, workflows, and long-horizon tasks | Strong operating philosophy and practical artifacts for AI-native engineering teams. |
| S12 | Microsoft | Foundry agent development lifecycle and adjacent build-process docs | Strong adjacent lifecycle source for tracing, evaluation, publishing, monitoring, and identities. |
| S13 | AWS | Amazon Q project-rules documentation (detailed implementation source) | Important for method implementation detail around durable context and rule loading. |
| S14 | NIST | AI RMF, AI RMF Core, SP 800-218A | Strong governance and secure-development overlay for lifecycle-wide controls. |

## Source details and URLs

### S1 — AWS AI-DLC and implementation material
- AI-Driven Development Life Cycle: Reimagining Software Engineering  
  https://aws.amazon.com/blogs/devops/ai-driven-development-life-cycle/
- Open-Sourcing Adaptive Workflows for AI-Driven Development Life Cycle (AI-DLC)  
  https://aws.amazon.com/blogs/devops/open-sourcing-adaptive-workflows-for-ai-driven-development-life-cycle-ai-dlc/
- Building with AI-DLC using Amazon Q Developer  
  https://aws.amazon.com/blogs/devops/building-with-ai-dlc-using-amazon-q-developer/
- Creating project rules for use with Amazon Q Developer chat  
  https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/context-project-rules.html

### S2 — Microsoft Community Hub example workflow
- An AI led SDLC: Building an End-to-End Agentic Software Development Lifecycle with Azure and GitHub  
  https://techcommunity.microsoft.com/blog/appsonazureblog/an-ai-led-sdlc-building-an-end-to-end-agentic-software-development-lifecycle-wit/4491896

### S3 — Microsoft Digital operating model
- Powering the new age of AI-led engineering in IT at Microsoft  
  https://www.microsoft.com/insidetrack/blog/powering-the-new-age-of-ai-led-engineering-in-it-at-microsoft/

### S4 — GitHub enterprise workflow
- Integrating agentic AI into your enterprise’s software development lifecycle  
  https://docs.github.com/en/copilot/tutorials/roll-out-at-scale/enable-developers/integrate-ai-agents

### S5 — GitHub coding-agent details
- About GitHub Copilot coding agent  
  https://docs.github.com/en/copilot/concepts/agents/coding-agent/about-coding-agent
- Managing access to GitHub Copilot coding agent  
  https://docs.github.com/en/enterprise-cloud@latest/copilot/concepts/agents/coding-agent/access-management

### S6 — GitHub AI governance roles and controls
- Establishing AI managers in your enterprise  
  https://docs.github.com/en/copilot/tutorials/roll-out-at-scale/establish-ai-managers
- Preparing to use custom agents in your enterprise  
  https://docs.github.com/en/enterprise-cloud@latest/copilot/how-tos/administer-copilot/manage-for-enterprise/manage-agents/prepare-for-custom-agents

### S7 — GitHub context and repo guidance
- Adding repository custom instructions for GitHub Copilot  
  https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions
- Using GitHub Copilot code review  
  https://docs.github.com/en/copilot/how-tos/use-copilot-agents/request-a-code-review/use-code-review
- Content exclusion  
  https://docs.github.com/en/copilot/concepts/context/content-exclusion

### S8 — GitHub Spec Kit
- Spec-driven development with AI: Get started with a new open source toolkit  
  https://github.blog/ai-and-ml/generative-ai/spec-driven-development-with-ai-get-started-with-a-new-open-source-toolkit/
- github/spec-kit repository  
  https://github.com/github/spec-kit

### S9 — BMAD
- Workflow Map  
  https://docs.bmad-method.org/reference/workflow-map/
- Getting Started  
  https://docs.bmad-method.org/tutorials/getting-started/
- Project Context  
  https://docs.bmad-method.org/explanation/project-context/
- Why Solutioning Matters  
  https://docs.bmad-method.org/explanation/why-solutioning-matters/
- Manage Project Context  
  https://docs.bmad-method.org/how-to/project-context/

### S10 — GitLab Duo Agent Platform
- GitLab Duo Agent Platform  
  https://about.gitlab.com/gitlab-duo-agent-platform/
- Introduction to GitLab Duo Agent Platform  
  https://about.gitlab.com/blog/introduction-to-gitlab-duo-agent-platform/
- Understanding flows: Multi-agent workflows  
  https://about.gitlab.com/blog/understanding-flows-multi-agent-workflows/
- Announcing general availability for GitLab Duo Agent Platform  
  https://about.gitlab.com/blog/gitlab-duo-agent-platform-is-generally-available/
- Agentic SDLC: GitLab and TCS deliver Intelligent Orchestration across the enterprise  
  https://about.gitlab.com/blog/agentic-sdlc-gitlab-and-tcs-deliver-intelligent-orchestration-across-the-enterprise/

### S11 — OpenAI AI-native engineering guidance
- Building an AI-Native Engineering Team  
  https://developers.openai.com/codex/guides/build-ai-native-engineering-team/
- Custom instructions with AGENTS.md  
  https://developers.openai.com/codex/guides/agents-md/
- Run long horizon tasks with Codex  
  https://developers.openai.com/blog/run-long-horizon-tasks-with-codex/
- Workflows  
  https://developers.openai.com/codex/workflows/
- Customization  
  https://developers.openai.com/codex/concepts/customization/

### S12 — Microsoft Foundry lifecycle and organization process guidance
- Agent development lifecycle  
  https://learn.microsoft.com/en-us/azure/foundry/agents/concepts/development-lifecycle
- Process to build agents across your organization  
  https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ai-agents/build-secure-process

### S13 — AWS implementation detail
- Creating project rules for use with Amazon Q Developer chat  
  https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/context-project-rules.html

### S14 — NIST lifecycle governance and secure development
- AI RMF Core  
  https://airc.nist.gov/airmf-resources/airmf/5-sec-core/
- AI RMF 1.0 PDF  
  https://nvlpubs.nist.gov/nistpubs/ai/nist.ai.100-1.pdf
- SP 800-218A news / publication links  
  https://csrc.nist.gov/news/2024/nist-publishes-sp-800-218a  
  https://csrc.nist.gov/projects/ssdf

## Notes on exclusions

The study intentionally did **not** elevate generic “AI helps developers” pages into the main corpus, even when they were current, because they often lack the artifact, stage, and governance detail needed for a meaningful process comparison. Secondary commentary sources were used sparingly and only for interpretation; they are not part of the formal primary corpus.
