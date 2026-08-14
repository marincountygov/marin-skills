---
name: marin-app-builder
summary: Build a focused MarinOS micro-app end to end, or review AI-generated code before accepting it, using Marin's existing standards and implementation rather than inventing new patterns.
description: Use this skill when asked to build, scaffold, or generate a new County of Marin micro-app, internal tool, review app, data-cleanup utility, form workflow, or dashboard using the MarinOS stack — or when reviewing AI-generated code intended to become a MarinOS app before accepting it.
---

# Marin app builder

## Purpose

Build small, focused MarinOS micro-apps using Marin's existing standards and implementation, not invented-on-the-spot patterns.

This skill is the synthesis point, not a fourth source of truth:

> `marin-digital-standards` (standards define) → `marin-ui` (UI implements) → `marin-app-template` (template assembles) → **this skill** (how an AI agent uses all three together) → the Marin product.

Don't restate any of those repos' content here beyond what's needed to sequence a build — consult them directly, and update this skill only if the sequencing itself changes. In particular, don't reconstruct the project structure or UI system from these docs when a working instance of both already exists in `marin-app-template` — start there instead.

## Before building, consult

- [`marin-app-template`](https://github.com/marincountygov/marin-app-template) — the starting point for every build. Its `index.html`, `assets/`, and vendored `marin-ui` bundle already encode the required shell, branding, menu behavior, font loading, theme handling, and accessibility baseline. Its `docs/development.md` covers customizing it and updating the vendored bundle.
- [`marin-ui/docs/architecture.md`](https://github.com/marincountygov/marin-ui/blob/main/docs/architecture.md) — frontend stack, file structure, JavaScript/storage rules, for anything the template doesn't already show.
- [`marin-ui/docs/components.md`](https://github.com/marincountygov/marin-ui/blob/main/docs/components.md) — the shared component library to draw from before writing new markup or CSS.
- [`marin-ui/docs/accessibility-implementation.md`](https://github.com/marincountygov/marin-ui/blob/main/docs/accessibility-implementation.md) and [`marin-digital-standards/accessibility`](https://github.com/marincountygov/marin-digital-standards/tree/main/accessibility) — WCAG 2.2 AA, for anything beyond what the template's shell already satisfies.
- [`marin-digital-standards/content-design`](https://github.com/marincountygov/marin-digital-standards/tree/main/content-design) — interface copy, heading case, plain language, descriptions.
- [`marin-digital-standards/brand`](https://github.com/marincountygov/marin-digital-standards/tree/main/brand) — only if a build needs a brand decision the template's already-configured tokens and shell don't cover.
- [`marin-digital-standards/product-design`](https://github.com/marincountygov/marin-digital-standards/tree/main/product-design) — only if the app is a resident-facing public service rather than an internal tool; the build workflow below assumes the internal-tool case by default.

Do not invent a new visual pattern, component, or copy convention when an approved one already covers the requirement — that's the single most common way a generated app drifts from the rest of MarinOS.

## Build workflow

1. Confirm scope: a small internal tool, review app, data-cleanup utility, form workflow, or dashboard (the default case this skill covers), or a resident-facing public service (also apply `marin-digital-standards/product-design`).
2. Start the project from `marin-app-template` (use it as the GitHub template, or copy its structure) rather than assembling `index.html`, the shell, branding, or menu behavior from scratch. Its vendored `marin-ui` bundle already provides Pico.css, `app-brand.css`, `app-shell.js`, and the local Jost font. Don't introduce React, Vue, Svelte, Angular, Next.js, Tailwind, Bootstrap, npm build steps, or frontend routing frameworks unless explicitly requested — the template deliberately has none.
3. Replace the `APP_NAME`, `APP_DESCRIPTION`, `APP_OWNER`, and `APP_REPO` placeholders in `index.html` and `README.md` with the real product name, one-sentence plain-language description, owner, and GitHub repo slug.
4. Add only application-specific code: replace the starter `#start` section in `index.html` with the real workflow, add app-specific state and behavior to `assets/app.js`, and add app-specific styling to `assets/app.css` only after confirming an existing `marin-ui` component or token doesn't already cover it. Leave `#about` and `#updates` in place — every app keeps About and Updates in `#app-nav`; `#start` already covers the "Home" case as the default view's own task tab, so no separate Home link is needed unless the workflow grows a distinct landing view later (see `marin-ui/docs/components.md`, "Standard app nav"). The default view must stay immediately functional — keep info/how-to/context content out of it and in About instead.
5. Use `localStorage` only for small preferences; `IndexedDB` via Dexie for real records or larger structured data; include JSON export/import for any meaningful local data.
6. Build the added content to WCAG 2.2 Level AA — the template's shell already meets this baseline, so focus here on whatever's new: form fields, dynamic content, custom controls. See `marin-ui/docs/accessibility-implementation.md` for the exact patterns.
7. If the app is meant to be part of MarinOS (not a one-off/private tool), register it: add an entry to [`marin-os/catalog.json`](https://github.com/marincountygov/marin-os) (id, name, type, url, description, audience, status, owner, `icon`) and the matching directory card to `marin-os/index.html`, then run `node scripts/check-catalog-sync.js` in that repo. That's the entire registration step — every other MarinOS app's banner menu picks up the new entry automatically at runtime; don't hand-edit any other app's repo. Also create a `marin.yml` manifest in the new app's repo (see `marin-app-template/marin.yml` for the fields and an existing app's for a filled-out example) and a short `AGENTS.md` pointing at `marin-ui`, `marin-digital-standards`, and `marin-skills`.

The skill should not independently recreate the project structure or UI system — if a build needs something the template and `marin-ui` don't provide, that's a signal to extend those repos, not to invent a one-off pattern inside a single product.

## Review checklist before accepting generated code

Whether this skill or another agent produced the code, verify before accepting it:

```text
The project was started from marin-app-template rather than assembled from scratch — check for TEMPLATE_VERSION and the vendored marin-ui bundle (BRAND_VERSION, shared/, vendor/).
No unnecessary framework was introduced.
Pico.css is used as the base layer; app-brand.css is used for County-specific styling.
The app has a skip link and one main landmark.
Jost is used for heading fonts from a local bundled font file with accessible fallbacks.
Light and dark colors follow the operating-system preference through `prefers-color-scheme`; no theme toggle or stored override is present.
The main menu collapses on narrow viewports with correct `aria-expanded` and `aria-controls` state.
Heading order is logical; all controls have visible labels; all buttons and links have accessible names.
The app is fully keyboard operable; focus states are visible and not obscured.
Color contrast passes WCAG 2.2 AA; status is not conveyed by color alone.
Dynamic messages use role="status" or role="alert" appropriately.
Forms expose clear validation errors; tables use proper headers and scope.
Touch/click targets are adequately sized; reduced motion is respected.
Logo artwork is not recreated or distorted.
The footer contains only the text MarinOS, linked to https://marincountygov.github.io/marin-os/.
The text-only Feedback button is present and has no icon.
Interface headings and labels use sentence case rather than forced all caps.
Directory card titles are the links; duplicate "Open" links are absent.
WAVE testing is run from an HTTP URL, or local-file access is enabled for the extension.
Local data has export/import if meaningful.
No APP_NAME, APP_DESCRIPTION, APP_OWNER, or APP_REPO placeholders remain.
The app nav includes About and Updates, plus a "Home" link only if the default view has no task-specific tab of its own (see `marin-ui/docs/components.md`, "Standard app nav"); the default view is immediately functional with no info/how-to content stacked into it.
If the app belongs in MarinOS, it's registered in marin-os/catalog.json and marin-os/index.html (not just built and left unlisted).
A marin.yml manifest and an AGENTS.md are present in the new app's repo.
```

For a resident-facing service specifically, also check it against `marin-digital-standards/product-design/principles.md`'s quality checklist (eligibility/requirements stated up front, one primary action per page, plain confirmation and next steps).

## Boundaries

This skill builds and reviews the *whole* app shell — it doesn't replace a focused review. For a deep pass on one dimension, use the specific skill instead: `accessibility-review` for WCAG conformance beyond this checklist, `design-review` for County visual-identity compliance, `plain-language-review` or `inclusive-language-review` for content, `digital-service-design` for a resident-facing service's task flow.

This skill doesn't own project scaffolding or the UI system — those belong to `marin-app-template` and `marin-ui` respectively. If a build repeatedly needs something neither provides, that's a signal to extend the template or `marin-ui`, not to work around the gap inside this skill or a single product.
