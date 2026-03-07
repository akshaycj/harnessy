# Default Web Stack

- Framework: Next.js
- Language: TypeScript
- Backend: Convex
- Auth: Clerk
- Styling: Tailwind CSS
- Components: shadcn/ui
- Validation: Zod
- State: Zustand (client) + Convex (server state)
- Analytics: PostHog
- Error tracking: Sentry
- Logging: Pino
- Animations: Motion

## Default Folder Structure (`apps/web`)

```text
apps/web/
├── convex/
│   ├── _generated/
│   ├── [domain]/
│   │   ├── queries.ts
│   │   ├── mutations.ts
│   │   ├── actions.ts
│   │   ├── helpers/
│   │   └── [sub-module].ts
│   ├── helpers/
│   ├── lib/
│   ├── schema.ts
│   ├── http.ts
│   └── crons.ts
├── src/
│   ├── app/
│   │   ├── (protected)/
│   │   ├── (marketing)/
│   │   └── api/
│   ├── frontend/
│   │   ├── components/
│   │   │   ├── ui/
│   │   │   └── custom/
│   │   ├── pages/
│   │   │   └── [feature]/
│   │   │       ├── [feature].tsx
│   │   │       ├── components/
│   │   │       ├── hooks/
│   │   │       └── store/
│   │   ├── hooks/
│   │   └── services/
│   ├── lib/
│   │   ├── convex/
│   │   └── observability/
│   └── shared/
│       ├── constants/
│       ├── types/
│       └── utils/
└── middleware.ts
```

## Structure Notes

- Use `apps/web`, not `apps/website`.
- Keep all business logic and DB access in `convex/`.
- Reserve `src/frontend/components/ui/` for shadcn/ui primitives.
- Keep `src/app/` focused on routing and route boundaries.
