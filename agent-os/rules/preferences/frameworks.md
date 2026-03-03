# Preferred Frameworks

These are default choices; use them unless constraints force an exception.

| Use Case | Preferred | Fallback |
| --- | --- | --- |
| Web app | Next.js | React + Vite |
| Mobile app | Expo | React Native CLI |
| macOS app | Tauri | SwiftUI |
| Backend + DB | Convex | Node API + Postgres/Supabase |
| Animations | Motion | CSS/native animations |

## Selection Rule

- Start with the preferred option.
- Deviate only for hard constraints (platform APIs, performance, legal, or delivery risk).
- Record deviation reason in `NNN.log.md`.
