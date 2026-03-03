# Agent Orchestration Contract

This file is the primary orchestration layer for this project.

## Execution Order

1. Read `agent-os/project/goal.md`.
2. Identify the active work item in `agent-os/project/tasks/` or `agent-os/project/bugs/`.
3. Read `agent-os/rules/common/workflow.md` first and treat it as the highest-priority execution contract.
4. Read the remaining common rules in `agent-os/rules/common/`.
5. Read stack mapping in `agent-os/rules/presets/` for the target app type.
6. Read preferences in `agent-os/rules/preferences/frameworks.md` and `agent-os/rules/preferences/integrations.md`.
7. Use skills and current official docs to resolve implementation details.
8. Append updates to the existing `NNN.log.md` for the same task/bug.

## Rule Resolution

- `common/*` defines global behavior and naming.
- `presets/*` defines app-type defaults.
- `preferences/*` defines preferred technologies, not static setup instructions.
- If a preference cannot be used, document the reason in `NNN.log.md`.

## Work Item File Contract

### Feature task folder

`agent-os/project/tasks/NNN-task-slug/`

- `NNN.raw.md`: raw request or PRD input.
- `NNN.spec.md`: phased implementation plan.
- `NNN.log.md`: ongoing implementation log.

### Bug folder

`agent-os/project/bugs/NNN-bug-slug/`

- `NNN.bug.md`: bug report and reproduction details.
- `NNN.log.md`: ongoing bugfix log.

Dynamic task and bug folders must not include `readme.md`.

## Examples Contract

- External references go in `agent-os/examples/<library>/`.
- Each example note must include source URL and a short applicability note.
