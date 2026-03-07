# Default Mobile Stack

- Framework: Expo
- Language: TypeScript
- Backend: Convex
- Auth: Clerk
- Validation: Zod
- State: Zustand + Convex
- Analytics: PostHog
- Error tracking: Sentry
- Logging: Pino
- Animations: Motion/native where appropriate

## Default Folder Structure (`apps/mobile`)

```text
apps/mobile/
├── src/
│   ├── app/
│   ├── features/
│   │   └── [feature]/
│   │       ├── screens/
│   │       ├── components/
│   │       ├── hooks/
│   │       └── store/
│   ├── components/
│   │   ├── ui/
│   │   └── custom/
│   ├── hooks/
│   ├── services/
│   ├── lib/
│   │   ├── convex/
│   │   └── observability/
│   └── shared/
│       ├── constants/
│       ├── types/
│       └── utils/
├── assets/
└── app.json
```

## Structure Notes

- Organize mobile flows in `src/features/` by feature.
- Keep Convex client wiring under `src/lib/convex/`.
- Keep shared cross-feature logic under `src/shared/`.
