
# GitHub Enterprise Agentic Workflow Profile

## What it is
GitHub’s enterprise workflow shows how agentic AI can operate inside a repository-centric delivery platform across planning, prototyping, implementation, testing, review, optimization, and security. [S4]

## Workflow shape
The explicit GitHub example is:
1. plan with Copilot Chat;
2. prototype with Spark;
3. create with models and agent mode;
4. test with MCP;
5. review with code review and custom agents;
6. optimize with Copilot coding agent;
7. secure with Copilot Autofix. [S4]

## Distinctive artifacts and controls
- issues and PRs
- repository-wide instructions
- path-specific instruction files
- code review instructions
- agent sessions and audit logs
- AI Controls
- enterprise AI manager roles [S4][S5][S6][S7]

## How AI participates
Copilot coding agent can evaluate tasks, make changes, open pull requests, request review, and iterate on feedback. Copilot can also review code and help remediate security issues. [S5]

## How humans stay in control
GitHub documents strong constraints:
- single-branch push access for the agent;
- workflow runs blocked by default pending approval;
- requester cannot approve the agent-created PR;
- enterprise/organization policy control and repo opt-out support. [S5][S6]

## Why it matters
GitHub is the strongest source in the corpus for treating the **pull request as the primary accountability boundary** for agentic work. It also shows what an enterprise AI governance surface looks like in practice. [S5][S6]

## Best fit
Repository-centric organizations that want to scale AI participation safely through issues, pull requests, reviews, and governed repository context.
