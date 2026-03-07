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
- A persistent execution history per contributor: `agent-os/project/users/<user-id>/tasks/*` and `agent-os/project/users/<user-id>/bugs/*`
- A reusable examples library: `agent-os/examples/*`
- A raw reference workspace: `references/repos/*` for cloned inspiration repos
- A structure that works for humans and agents together

## Core Workflow

For each feature task:

1. Create the item with `agent-os/scripts/new-work-item.sh task <slug>`.
2. `<work-id>.raw.md` captures the request and constraints.
3. `<work-id>.spec.md` captures phased implementation steps.
4. `<work-id>.log.md` captures execution details, decisions, verification, and follow-ups.

For each bug:

1. Create the item with `agent-os/scripts/new-work-item.sh bug <slug>`.
2. `<work-id>.bug.md` captures reproduction and impact.
3. `<work-id>.log.md` captures investigation, fix, and verification.

Rule: exactly one log file per task or bug, continuously appended.
Work item IDs use `YYYYMMDD-HHMMSS`, so sorting by folder name is chronological.

## Controlled Agent Execution

Agents must execute in this order:

1. Read project goal in `agent-os/project/goal.md`
2. Resolve contributor workspace in `agent-os/project/users/<user-id>/`
3. Resolve active task/bug folder in that user workspace
4. Read `agent-os/rules/common/workflow.md` first
5. Read remaining common rules
6. Read stack defaults and preferences
7. Implement and append updates to the same `<work-id>.log.md`

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
│   │   ├── decisions/
│   │   ├── templates/
│   │   │   ├── task/
│   │   │   └── bug/
│   │   ├── users/
│   │   │   └── <user-id>/
│   │   │       ├── tasks/
│   │   │       └── bugs/
│   ├── scripts/
│   └── examples/
├── apps/
└── references/
```

## Quick Start

1. Copy this template into a new repository.
2. Update `agent-os/project/goal.md` for your project.
3. Set preferred defaults in `agent-os/rules/preferences/`.
4. Create your first user-scoped task with `agent-os/scripts/new-work-item.sh task <slug>`.
5. Clone external inspiration repos into `references/repos/` when needed.
6. Run agent sessions through `AGENTS.md` and keep logs updated.

## Why This Works

Prompt-only workflows optimize for immediate output. Structured workflows optimize for sustained progress.

This template helps you keep speed while adding:

- accountability
- auditability
- repeatability
- cross-session memory

So agents do not just write code; they produce trackable engineering work.
