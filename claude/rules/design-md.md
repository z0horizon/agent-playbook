# Brand References (awesome-design-md)

Optional add-on to the Design Brief in `~/.claude/CLAUDE.md` section 2, for setups with the `awesome-design-md` collection at `~/.agents/design-md/`. It supplies the brand reference in the brief's precedence order and the `/agy-ui <brand>` presets.

- **Brand Reference layer**: when the user names or implies a reference brand (e.g., Linear, Stripe, Vercel, Apple, Cursor, Raycast, Supabase, Airbnb, Notion, Figma), read `~/.agents/design-md/<brand>/DESIGN.md` for surface hierarchy, color tokens, typography scale, border treatments, and elevation rules. Skip this layer when no brand is in play.
- **Presets**: `/agy-ui <brand>` resolves `<brand>` against `ls ~/.agents/design-md/`.
- **Hand-off**: `agy` may read `~/.agents/design-md/` only for what the brief leaves open, and declares it under `DECISIONS`.
