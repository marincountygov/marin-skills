# App Maintainer Skill

A reusable AI Skill for bringing an existing MarinOS app up to date with the current `marin-ui` bundle and platform standards, and reporting what's left for a human to decide.

This is the maintenance counterpart to [`marin-app-builder`](https://github.com/marincountygov/marin-skills/tree/main/marin-app-builder): that skill governs a build's first pass, this one governs every pass after. It reads an app's `marin.yml` to see how far behind it is, walks the relevant `marin-ui/CHANGELOG.md` entries, runs the existing `sync-consumer.sh` script, applies any markup changes the sync alone can't cover, and reports the rest.

## Files

- `SKILL.md` — what to consult before maintaining, the maintenance workflow, and boundaries with `marin-app-builder`.

## History

Added alongside `marin.yml` project manifests and per-repo `AGENTS.md` files, after a session of manually syncing seven consumer apps to a new `marin-ui` release by hand (checking `BRAND_VERSION`, running `sync-consumer.sh`, then hunting for markup that needed a matching update). This skill formalizes that repeatable sequence instead of re-deriving it each time.
