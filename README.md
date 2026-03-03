# Agent-First Project Template

Goal-oriented repository structure for teams building with AI coding agents.

## Why Use This Template

Most AI-assisted projects start with a prompt and immediately jump into implementation. That is fast, but usually unstructured: no stable plan, no durable context, and no reliable record of why decisions were made.

This template turns that into a controlled workflow:

- every task starts with explicit input
- every implementation follows a scoped spec
- every decision is logged for future sessions
- every agent follows the same orchestration contract

## What You Get

- A central agent control file: `AGENTS.md`
- A modular rule system: `agent-os/rules/`
- A persistent execution history: `agent-os/project/tasks/*` and `agent-os/project/bugs/*`
- A reusable examples library: `agent-os/examples/*`
- A structure that works for humans and agents together

## Core Workflow

For each feature task:

1. `NNN.raw.md` captures the request and constraints.
2. `NNN.spec.md` captures phased implementation steps.
3. `NNN.log.md` captures execution details, decisions, verification, and follow-ups.

For each bug:

1. `NNN.bug.md` captures reproduction and impact.
2. `NNN.log.md` captures investigation, fix, and verification.

Rule: exactly one log file per task or bug, continuously appended.

## Controlled Agent Execution

Agents must execute in this order:

1. Read project goal in `agent-os/project/goal.md`
2. Resolve active task/bug folder
3. Read `agent-os/rules/common/workflow.md` first
4. Read remaining common rules
5. Read stack defaults and preferences
6. Implement and append updates to the same `NNN.log.md`

This creates continuity across sessions and prevents context loss.

## Who This Is For

- Solo builders using agents for end-to-end shipping
- Teams coordinating multiple agents and contributors
- Agencies that need repeatable AI delivery standards
- Open-source maintainers who want traceable AI-generated changes

## Repository Structure

```text
.
├── AGENTS.md
├── agent-os/
│   ├── rules/
│   │   ├── common/
│   │   ├── preferences/
│   │   └── presets/
│   ├── project/
│   │   ├── goal.md
│   │   ├── plans/
│   │   ├── tasks/
│   │   ├── bugs/
│   │   └── decisions/
│   └── examples/
├── apps/
└── references/
```

## Quick Start

1. Copy this template into a new repository.
2. Update `agent-os/project/goal.md` for your project.
3. Set preferred defaults in `agent-os/rules/preferences/`.
4. Create your first task folder in `agent-os/project/tasks/NNN-task-slug/`.
5. Run agent sessions through `AGENTS.md` and keep logs updated.

## Why This Works

Prompt-only workflows optimize for immediate output. Structured workflows optimize for sustained progress.

This template helps you keep speed while adding:

- accountability
- auditability
- repeatability
- cross-session memory

So agents do not just write code; they produce trackable engineering work.
