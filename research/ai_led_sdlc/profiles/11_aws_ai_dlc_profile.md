
# AWS AI-DLC Profile

## What it is
AWS AI-DLC is an enterprise method for treating AI as a central collaborator across software delivery, with human oversight embedded at critical decisions. AWS positions it as an alternative to both narrow AI assistance and unchecked AI autonomy. [S1]

## Workflow shape
The most concrete implementation materials describe three phases: **Inception**, **Construction**, and **Operations**. The workflow starts from a high-level problem statement, classifies the workspace, asks clarifying questions, and chooses the next stage adaptively rather than forcing every project through the same path. [S1]

## Distinctive artifacts
- `.amazonq/rules` project rules
- persistent core workflow instructions
- stage-specific rule files
- generated artifacts and audit outputs
- workflow state / documentation files [S1][S13]

## How AI participates
AI creates detailed work plans, asks for clarification, chooses workflow branches, generates artifacts, and performs implementation work. It is meant to direct execution while humans retain approval over critical choices. [S1]

## How humans stay in control
AWS explicitly centers “AI powered execution with human oversight.” The workflow is designed to ask clarifying questions and defer important decisions rather than making hidden assumptions. [S1]

## Why it matters
AWS is the strongest method-level source in the corpus for **adaptive rigor**. It argues directly that one-size-fits-all workflows and fixed stage depth limit sustainable productivity. That makes AWS especially important when designing a house method that must flex by work type and risk. [S1]

## Best fit
Organizations that need an adaptive, rule-driven method and want to embed workflow discipline in source-controlled instructions rather than in ad hoc prompting alone.
