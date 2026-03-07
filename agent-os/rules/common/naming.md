# Naming Conventions

## Folders

- Use `kebab-case` for folder names by default.
- Use `agent-os/project/users/<user-id>/` for user-scoped execution records.
- Use `YYYYMMDD-HHMMSS-slug` for task folders inside each user folder.
- Use `YYYYMMDD-HHMMSS-slug` for bug folders inside each user folder.
- Use timestamp IDs for chronological sort and to avoid shared numeric counters.

## Files

- Use `kebab-case` file names by default.
- Use required task file names: `<work-id>.raw.md`, `<work-id>.spec.md`, `<work-id>.log.md`.
- Use required bug file names: `<work-id>.bug.md`, `<work-id>.log.md`.

## Convex Exception

- Files and folders inside `apps/backend/convex/` use `camelCase` when needed to match Convex conventions.
