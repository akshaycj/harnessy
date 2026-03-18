# Workflow Contract

## Feature Workflow

1. Resolve `<user-id>` from local git identity and work inside `agent-os/project/users/<user-id>/`.
2. Create or locate `agent-os/project/users/<user-id>/tasks/YYYYMMDD-HHMMSS-<slug>/`.
3. Capture the request in `<work-id>.raw.md`.
4. Review `agent-os/project/goal.md` and `README.md` for documentation impact.
5. Record `Goal impact` and `README impact` in `<work-id>.spec.md` as `none`, `minor`, or `major`.
6. Update `agent-os/project/goal.md` before implementation when the feature changes project direction, scope, milestones, or success criteria.
7. Implement changes.
8. Update `README.md` after implementation when the repository's actual public shape, workflow, setup, or architecture changed.
9. Append progress, decisions, documentation review results, and outcomes to `<work-id>.log.md`.

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
- Feature logs should state whether `agent-os/project/goal.md` and `README.md` were reviewed and whether either file changed.
