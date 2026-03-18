# Convex Operating Rules

Use this file whenever Convex is part of the selected stack.

These rules turn Convex best practices into default implementation policy for this repository.

## Core Defaults

- Write Convex code in TypeScript.
- Treat `apps/web/convex/schema.ts` or the active app's Convex `schema.ts` as the database source of truth.
- Keep `query`, `mutation`, `action`, `internalQuery`, `internalMutation`, and `internalAction` wrappers thin.
- Put shared business logic in plain TypeScript helpers instead of duplicating logic across Convex functions.

## Data Access Rules

- Await every Convex promise. Do not leave floating promises from `ctx.db`, `ctx.scheduler`, or `ctx.run*`.
- Prefer `.withIndex(...)` or `.withSearchIndex(...)` over query `.filter(...)`.
- Use query `.filter(...)` only when it is clearly more appropriate than indexing, or when filtering paginated results.
- Use `.collect()` only for small, bounded result sets. If result count can grow materially, use indexing, pagination, `.take(...)`, denormalized counters, or a different product shape.
- Audit indexes for redundant prefixes. If `by_foo_and_bar` covers `by_foo`, prefer the more specific index unless sort behavior requires both.
- Always include the table name in `ctx.db.get`, `ctx.db.patch`, `ctx.db.replace`, and `ctx.db.delete`.
- Do not use `Date.now()` inside Convex queries. Model time-based state explicitly or pass coarse-grained time from the client.

## Public Function Safety

- Every public `query`, `mutation`, and `action` must define argument validators.
- Public functions must enforce access control with `ctx.auth.getUserIdentity()` or another unspoofable secret identifier.
- Do not use spoofable arguments like email for authorization checks.
- Prefer granular public functions with narrow permissions over broad `update*` functions.

## Internal Function Boundaries

- Only schedule internal functions.
- Only call internal functions via `ctx.runQuery`, `ctx.runMutation`, `ctx.runAction`, `ctx.scheduler`, or `crons.ts`.
- Do not call public `api.*` functions from Convex server code when an internal function is appropriate.
- If public and internal flows share logic, extract a helper and keep the public wrapper responsible for auth and validation.

## Composition Rules

- Prefer plain TypeScript helpers over `ctx.runQuery` and `ctx.runMutation` inside queries and mutations.
- Use `ctx.runQuery` and `ctx.runMutation` sparingly in actions. Avoid sequential chains when a single internal function can provide a consistent transaction boundary.
- Use `runAction` only when crossing runtime boundaries or using code that requires a different runtime.
- Prefer workflow-style action chains that record progress through mutations rather than opaque background jobs.

## Type Safety Rules

- Use generated `Doc`, `Id`, `QueryCtx`, `MutationCtx`, and `ActionCtx` types in shared helpers.
- Reuse validators and infer types from them when appropriate.
- Prefer `WithoutSystemFields<Doc<...>>` for insert/update helper inputs when that matches intent.

## Performance Defaults

- Use queries for nearly all app reads.
- Keep synchronous Convex transactions light and fast.
- Use actions sparingly for external services, batch jobs, or runtime-specific code.
- Let Convex handle client-side caching and consistency. Do not add redundant client caches unless there is a proven need.

## Review Checklist

- Search for unawaited Convex calls.
- Search for query `.filter(...)` usage and justify each one.
- Search for `.collect()` usage and confirm each result set is bounded.
- Search for missing validators on public functions.
- Search for missing auth checks on public functions.
- Search for `api.` references inside Convex server code and confirm they should not be `internal.`.
- Search for `runAction`, sequential `ctx.runQuery`, and sequential `ctx.runMutation` usage and confirm each one is justified.
