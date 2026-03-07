# Harness-First Agent Engineering Template

This template codifies a workflow used in production over years: humans steer, agents execute, and the repository acts as the system of record.

Recent industry writing now reflects this same direction:
[Harness engineering: leveraging Codex in an agent-first world](https://openai.com/index/harness-engineering/)

## Why This Exists

Prompt-only workflows move fast at first, then collapse into ambiguity:

- unclear ownership of requirements
- weak continuity between sessions
- no durable decision trail
- context trapped in chat instead of codebase

This template solves that by turning your repo into an execution harness with explicit structure, memory, and execution contracts.

## Harness Principles

1. Human attention is the bottleneck.
2. Agent legibility is a first-class engineering concern.
3. `AGENTS.md` is a map, not an encyclopedia.
4. Plans, logs, and rules are versioned in-repo.
5. Parallel work must avoid naming collisions by default.
6. Structure and constraints beat ad-hoc prompting.

## What You Get

- Orchestration contract: `AGENTS.md` and `CLAUDE.md`
- Modular rules: `agent-os/rules/common|presets|preferences`
- User-scoped execution history: `agent-os/project/users/<user-id>/`
- Shared project memory: `agent-os/project/goal.md`, `plans/`, `decisions/`
- Reusable templates: `agent-os/project/templates/task|bug`
- Work item generator: `agent-os/scripts/new-work-item.sh`
- Curated pattern library: `agent-os/examples/*`
- Raw external context workspace: `references/repos/*`

## Work Item Model (Chronological + Collision-Resistant)

All task and bug folders use:

`YYYYMMDD-HHMMSS-<slug>`

Example:

`20260307-092401-auth-session-refresh`

This gives you:

- natural chronological sort by folder name
- clear visual signal of what changed most recently
- no shared global counters between collaborators

## How Execution Works

For each feature task:

1. Run `agent-os/scripts/new-work-item.sh task <slug>`
2. Fill `<work-id>.raw.md`
3. Fill `<work-id>.spec.md`
4. Append implementation history in `<work-id>.log.md`

For each bug:

1. Run `agent-os/scripts/new-work-item.sh bug <slug>`
2. Fill `<work-id>.bug.md`
3. Append fix history in `<work-id>.log.md`

Rule:

- exactly one log file per work item
- always append, never fork log variants

## Team Parallelism by Design

Each contributor writes under:

`agent-os/project/users/<user-id>/tasks|bugs`

`<user-id>` is derived from local git identity by the helper script, so two teammates can create work items at the same time without stepping on shared numeric IDs.

## Repository Topology

```text
.
├── AGENTS.md
├── CLAUDE.md
├── agent-os/
│   ├── rules/
│   │   ├── common/
│   │   ├── presets/
│   │   └── preferences/
│   ├── project/
│   │   ├── goal.md
│   │   ├── plans/
│   │   ├── decisions/
│   │   ├── templates/
│   │   │   ├── task/
│   │   │   └── bug/
│   │   └── users/
│   │       └── <user-id>/
│   │           ├── tasks/
│   │           └── bugs/
│   ├── scripts/
│   └── examples/
├── apps/
│   ├── web/
│   ├── mobile/
│   ├── mac/
│   └── backend/
└── references/
    └── repos/
```

## Quick Start

1. Copy this template into a new repository.
2. Define project intent in `agent-os/project/goal.md`.
3. Tune stack defaults in `agent-os/rules/presets/` and `preferences/`.
4. Create your first task:
   `agent-os/scripts/new-work-item.sh task bootstrap-foundation`
5. Run agent sessions through `AGENTS.md`.
6. Keep all decisions and execution traces inside the repo.

## What This Optimizes For

- Speed with control
- High-throughput agent collaboration
- Traceable engineering decisions
- Cross-session continuity
- Long-horizon maintainability

The goal is not just AI-generated code.
The goal is a repository that continuously improves as an engineering control system.
