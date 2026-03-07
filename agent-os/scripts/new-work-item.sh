#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
PROJECT_ROOT="${REPO_ROOT}/agent-os/project"

usage() {
  echo "Usage: agent-os/scripts/new-work-item.sh <task|bug> <slug> [user-id]"
  exit 1
}

slugify() {
  printf "%s" "$1" \
    | tr "[:upper:]" "[:lower:]" \
    | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//; s/-+/-/g'
}

resolve_user_id() {
  local raw_name raw_email raw
  raw_name="$(git config user.name || true)"
  raw_email="$(git config user.email || true)"

  if [ -n "${raw_name}" ]; then
    raw="${raw_name}"
  elif [ -n "${raw_email}" ]; then
    raw="${raw_email%@*}"
  else
    raw="$(whoami)"
  fi

  slugify "${raw}"
}

timestamp_id() {
  date "+%Y%m%d-%H%M%S"
}

TYPE="${1:-}"
RAW_SLUG="${2:-}"
USER_ID="${3:-}"

[ -n "${TYPE}" ] || usage
[ -n "${RAW_SLUG}" ] || usage

if [ -z "${USER_ID}" ]; then
  USER_ID="$(resolve_user_id)"
fi

USER_ID="$(slugify "${USER_ID}")"
SLUG="$(slugify "${RAW_SLUG}")"

if [ -z "${USER_ID}" ] || [ -z "${SLUG}" ]; then
  echo "Could not resolve valid user-id or slug."
  exit 1
fi

case "${TYPE}" in
  task)
    WORK_ROOT="${PROJECT_ROOT}/users/${USER_ID}/tasks"
    TEMPLATE_ROOT="${PROJECT_ROOT}/templates/task"
    ;;
  bug)
    WORK_ROOT="${PROJECT_ROOT}/users/${USER_ID}/bugs"
    TEMPLATE_ROOT="${PROJECT_ROOT}/templates/bug"
    ;;
  *)
    usage
    ;;
esac

mkdir -p "${PROJECT_ROOT}/users/${USER_ID}/tasks" "${PROJECT_ROOT}/users/${USER_ID}/bugs"

while true; do
  ITEM_ID="$(timestamp_id)"
  ITEM_DIR="${WORK_ROOT}/${ITEM_ID}-${SLUG}"
  if [ ! -d "${ITEM_DIR}" ]; then
    break
  fi
  sleep 1
done

mkdir -p "${ITEM_DIR}"

if [ "${TYPE}" = "task" ]; then
  cp "${TEMPLATE_ROOT}/template.raw.md" "${ITEM_DIR}/${ITEM_ID}.raw.md"
  cp "${TEMPLATE_ROOT}/template.spec.md" "${ITEM_DIR}/${ITEM_ID}.spec.md"
  cp "${TEMPLATE_ROOT}/template.log.md" "${ITEM_DIR}/${ITEM_ID}.log.md"
else
  cp "${TEMPLATE_ROOT}/template.bug.md" "${ITEM_DIR}/${ITEM_ID}.bug.md"
  cp "${TEMPLATE_ROOT}/template.log.md" "${ITEM_DIR}/${ITEM_ID}.log.md"
fi

echo "User ID: ${USER_ID}"
echo "Work ID: ${ITEM_ID}"
echo "Created: ${ITEM_DIR}"
