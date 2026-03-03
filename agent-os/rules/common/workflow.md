# Workflow Contract

## Feature Workflow

1. Create or locate `agent-os/project/tasks/NNN-task-slug/`.
2. Capture the request in `NNN.raw.md`.
3. Convert it into phased implementation steps in `NNN.spec.md`.
4. Implement changes.
5. Append progress, decisions, and results to `NNN.log.md`.

## Bug Workflow

1. Create or locate `agent-os/project/bugs/NNN-bug-slug/`.
2. Document reproduction and impact in `NNN.bug.md`.
3. Implement and validate the fix.
4. Append all bugfix progress to `NNN.log.md`.

## Logging Rule

- Keep exactly one log file per task/bug and keep appending to it.
- Do not create extra log variants for the same work item.
