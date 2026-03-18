# Agent Orchestration Contract

This file is the primary orchestration layer for this project.

## Execution Order

1. Read `agent-os/project/goal.md`.
2. Resolve contributor ID from local git user (`git config user.name`) and use `agent-os/project/users/<user-id>/`.
3. Identify or create the active work item in `agent-os/project/users/<user-id>/tasks/` or `agent-os/project/users/<user-id>/bugs/` using `YYYYMMDD-HHMMSS-<slug>`.
4. Read `agent-os/rules/common/workflow.md` first and treat it as the highest-priority execution contract.
5. Read the remaining common rules in `agent-os/rules/common/`.
6. Read stack mapping in `agent-os/rules/presets/` for the target app type.
7. Read preferences in `agent-os/rules/preferences/frameworks.md` and `agent-os/rules/preferences/integrations.md`.
8. If Convex is part of the selected stack, read `agent-os/rules/preferences/convex.md`.
9. Read relevant material in `references/` when external context is needed.
10. Use skills and current official docs to resolve implementation details.
11. Append updates to the existing `<work-id>.log.md` for the same task/bug.

## Rule Resolution

- `common/*` defines global behavior and naming.
- `presets/*` defines app-type defaults.
- `preferences/*` defines preferred technologies, not static setup instructions.
- If a preference cannot be used, document the reason in `<work-id>.log.md`.
- Task and bug IDs are chronological timestamps per item (`YYYYMMDD-HHMMSS`), not global numeric counters.

## Work Item File Contract

### Feature task folder

`agent-os/project/users/<user-id>/tasks/YYYYMMDD-HHMMSS-slug/`

- `<work-id>.raw.md`: raw request or PRD input.
- `<work-id>.spec.md`: phased implementation plan.
- `<work-id>.log.md`: ongoing implementation log.

### Bug folder

`agent-os/project/users/<user-id>/bugs/YYYYMMDD-HHMMSS-slug/`

- `<work-id>.bug.md`: bug report and reproduction details.
- `<work-id>.log.md`: ongoing bugfix log.

Dynamic task and bug folders must not include `readme.md`.

## Template Folder Contract

- Task and bug templates live in `agent-os/project/templates/task/` and `agent-os/project/templates/bug/`.
- Use `agent-os/scripts/new-work-item.sh` to create work items from templates.
- Never write real execution history in template files.

## Examples Contract

- External references go in `agent-os/examples/<library>/`.
- Each example note must include source URL and a short applicability note.

## References Contract

- Store raw external links, notes, and assets in `references/`.
- Clone external repositories for inspiration in `references/repos/<repo-name>/`.
- Distilled reusable patterns belong in `agent-os/examples/<library>/`.
