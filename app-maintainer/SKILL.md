---
name: app-maintainer
summary: Bring an existing MarinOS app up to date with the current marin-ui bundle and platform standards, and report what still needs manual attention.
description: Use this skill when asked to upgrade a Marin app to the latest marin-ui, check a repo for platform drift, fix an out-of-date shared bundle, or bring an app up to current MarinOS standards — as opposed to marin-app-builder, which builds a new app or reviews one being built for the first time.
---

# App maintainer

## Purpose

Keep an already-built MarinOS app aligned with the platform it was built on, instead of letting it drift until a rebuild is the only option. This skill is the maintenance counterpart to `marin-app-builder`: that skill governs a build's first pass, this one governs every pass after.

## Before maintaining, consult

- The app's own `marin.yml` — its recorded `platform.marin-ui` and `platform.template` versions are the starting point for "how far behind is this app," not a guess or a diff of every file.
- [`marin-ui/CHANGELOG.md`](https://github.com/marincountygov/marin-ui/blob/main/CHANGELOG.md) — read every entry between the app's recorded version and the current `BRAND_VERSION`, not just the latest one. Each entry states why the change was made and what it affects.
- [`marin-ui/docs/components.md`](https://github.com/marincountygov/marin-ui/blob/main/docs/components.md) — the current state of any pattern the changelog touched, to check whether the app's own markup needs a matching update beyond the file copy.
- The app's own `AGENTS.md` — repo-specific notes an agent should know before editing (standing holds on committing, non-standard structure, etc.).

## Maintenance workflow

1. Compare the app's `marin.yml`/`BRAND_VERSION` against `marin-ui`'s current `BRAND_VERSION`. If they already match, there's nothing to sync — move to step 5 to check for drift that isn't captured by version number alone (e.g. a pattern the app never adopted).
2. Read the `marin-ui/CHANGELOG.md` entries between those two versions. Note which changes are pure file-copy (CSS/JS fixes, new generic behaviors) versus which require a matching HTML change in the consumer (a renamed class, a new required data attribute, a markup pattern change like the About/Home nav standardization).
3. Run `marin-ui/scripts/sync-consumer.sh ../<repo>` to update the vendored `shared/app-brand.css`, `shared/app-shell.js`, `vendor/`, and `BRAND_VERSION`. This is always safe — it's a file copy, not a merge.
4. For each changelog entry that requires a markup change, apply it to the app's HTML directly (don't leave the app on old markup with new shared files — that's a broken hybrid state, not a completed sync). Update the app's `marin.yml` `platform.marin-ui` field to match.
5. Check for drift the version number doesn't capture: a component built before a now-standard pattern existed (e.g. a hand-written dropdown before `.menu` existed), a nav that doesn't match the current "About/Home/Updates" standard in `marin-ui/docs/components.md`, or content sitting in the default view that current guidance says belongs in About.
6. There is no automated check command yet — manually verify against the review checklist in `marin-app-builder/SKILL.md` before considering the app current.
7. Report what was synced automatically, what markup was updated to match, and what's left for a human to decide (a genuine design choice, a missing owner, a repo under a commit hold).

## Boundaries

This skill doesn't redesign an app or add features — that's a build task for `marin-app-builder` or the app's own maintainer. It doesn't touch `marin-ui` itself; if a needed fix isn't in `marin-ui` yet, that's a signal to fix `marin-ui` first (see `marin-ui/AGENTS.md`) and then run this skill against the consumer, not to patch around the gap inside one app. It doesn't decide whether an app should be deprecated or archived — that's an ownership decision, report the drift and let the owner decide.
