# Workflow Contract

## Feature Workflow

1. Resolve `<user-id>` from local git identity and work inside `agent-os/project/users/<user-id>/`.
2. Create or locate `agent-os/project/users/<user-id>/tasks/YYYYMMDD-HHMMSS-<slug>/`.
3. Capture the request in `<work-id>.raw.md`.
4. Convert it into phased implementation steps in `<work-id>.spec.md`.
5. Implement changes.
6. Append progress, decisions, and results to `<work-id>.log.md`.

## Bug Workflow

1. Resolve `<user-id>` from local git identity and work inside `agent-os/project/users/<user-id>/`.
2. Create or locate `agent-os/project/users/<user-id>/bugs/YYYYMMDD-HHMMSS-<slug>/`.
3. Document reproduction and impact in `<work-id>.bug.md`.
4. Implement and validate the fix.
5. Append all bugfix progress to `<work-id>.log.md`.

## Work Item Creation Helper

- Use `agent-os/scripts/new-work-item.sh task <slug>` to create a user-scoped task folder.
- Use `agent-os/scripts/new-work-item.sh bug <slug>` to create a user-scoped bug folder.
- The helper derives `<user-id>` from git config and uses chronological IDs (`YYYYMMDD-HHMMSS`).

## Logging Rule

- Keep exactly one log file per task/bug and keep appending to it.
- Do not create extra log variants for the same work item.
