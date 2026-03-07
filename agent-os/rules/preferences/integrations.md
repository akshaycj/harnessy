# Preferred Integrations

These are default service choices; implementation details should be resolved at runtime via skills and current docs.

| Concern | Preferred Integration |
| --- | --- |
| Authentication | Clerk |
| Backend data and functions | Convex |
| Error tracking | Sentry |
| Product analytics | PostHog |
| Schema validation | Zod |
| Styling system | Tailwind CSS |
| UI primitives | shadcn/ui |
| Client state | Zustand |
| Logging | Pino |

## Selection Rule

- Use preferred integrations first.
- Deviate only when constraints require it.
- Record every deviation reason in `<work-id>.log.md`.
