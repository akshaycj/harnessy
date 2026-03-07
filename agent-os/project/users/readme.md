This folder stores user-scoped execution workspaces as `agent-os/project/users/<user-id>/`.

Each user workspace contains:

- `tasks/` for feature work items (`YYYYMMDD-HHMMSS-<slug>`).
- `bugs/` for bugfix work items (`YYYYMMDD-HHMMSS-<slug>`).

Use `agent-os/scripts/new-work-item.sh` to auto-create user folders and chronological work item IDs based on local git username.
