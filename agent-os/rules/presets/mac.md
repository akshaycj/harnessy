# Default macOS Stack

- Framework: Tauri
- Language: TypeScript + Rust (Tauri runtime)
- Backend: Convex
- Auth: Clerk (if account-gated)
- Validation: Zod
- Error tracking: Sentry
- Analytics: PostHog
- Logging: Pino or platform-native logging based on runtime
- Animations: Motion (webview) or native transitions when required

## Default Folder Structure (`apps/mac`)

```text
apps/mac/
├── src/
│   ├── app/
│   ├── features/
│   │   └── [feature]/
│   │       ├── views/
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
└── src-tauri/
    ├── src/
    ├── Cargo.toml
    └── tauri.conf.json
```

## Structure Notes

- Keep UI logic in `src/` and runtime/native concerns in `src-tauri/`.
- Keep Tauri command bridge thin and domain logic typed in TypeScript.
- Use `src/features/` for isolated feature modules.
