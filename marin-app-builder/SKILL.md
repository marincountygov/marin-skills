---
name: marin-app-builder
summary: Build a focused MarinOS micro-app end to end, or review AI-generated code before accepting it, using Marin's existing standards and implementation rather than inventing new patterns.
description: Use this skill when asked to build, scaffold, or generate a new County of Marin micro-app, internal tool, review app, data-cleanup utility, form workflow, or dashboard using the MarinOS stack — or when reviewing AI-generated code intended to become a MarinOS app before accepting it.
---

# Marin app builder

## Purpose

Build small, focused MarinOS micro-apps using Marin's existing standards and implementation, not invented-on-the-spot patterns.

This skill is the synthesis point, not a third source of truth:

> `marin-digital-standards` (policy — what's required) → `marin-ui` (implementation — how it's built) → **this skill** (how an AI agent uses both together) → the Marin product.

Don't restate either repo's content here beyond what's needed to sequence a build — consult them directly, and update this skill only if the sequencing itself changes.

## Before building, consult

- [`marin-ui/docs/architecture.md`](https://github.com/marincountygov/marin-ui/blob/main/docs/architecture.md) — frontend stack, file structure, JavaScript/storage rules.
- [`marin-ui/docs/foundations.md`](https://github.com/marincountygov/marin-ui/blob/main/docs/foundations.md) and [`marin-digital-standards/brand`](https://github.com/marincountygov/marin-digital-standards/tree/main/brand) — color and typography.
- [`marin-ui/docs/components.md`](https://github.com/marincountygov/marin-ui/blob/main/docs/components.md) — required shared CSS classes and the `.menu` disclosure component.
- [`marin-ui/docs/app-shell.md`](https://github.com/marincountygov/marin-ui/blob/main/docs/app-shell.md) — the required shell markup.
- [`marin-ui/docs/accessibility-implementation.md`](https://github.com/marincountygov/marin-ui/blob/main/docs/accessibility-implementation.md) and [`marin-digital-standards/accessibility`](https://github.com/marincountygov/marin-digital-standards/tree/main/accessibility) — WCAG 2.2 AA, both what's required and how Marin UI implements it.
- [`marin-digital-standards/content-design`](https://github.com/marincountygov/marin-digital-standards/tree/main/content-design) — interface copy, heading case, plain language, descriptions.
- [`marin-digital-standards/product-design`](https://github.com/marincountygov/marin-digital-standards/tree/main/product-design) — only if the app is a resident-facing public service rather than an internal tool; the build workflow below assumes the internal-tool case by default.

Do not invent a new visual pattern, component, or copy convention when an approved one already covers the requirement — that's the single most common way a generated app drifts from the rest of MarinOS.

## Build workflow

1. Confirm scope: a small internal tool, review app, data-cleanup utility, form workflow, or dashboard (the default case this skill covers), or a resident-facing public service (also apply `marin-digital-standards/product-design`).
2. Use the default frontend stack and file structure from `marin-ui/docs/architecture.md`: semantic HTML, Pico.css, `shared/app-brand.css`, vanilla JavaScript, Alpine.js only if it materially simplifies repetitive DOM state, Dexie.js only if the app needs IndexedDB-backed record storage. Don't introduce React, Vue, Svelte, Angular, Next.js, Tailwind, Bootstrap, npm build steps, or frontend routing frameworks unless explicitly requested.
3. Start from the required app shell in `marin-ui/docs/app-shell.md`: skip link, MarinOS banner (the `.menu` dropdown, not a plain link), product icon, app title, main landmark, MarinOS footer, text-only Feedback button.
4. Derive branding from `marin-digital-standards/brand` and the token implementation in `marin-ui/docs/foundations.md`. Never recreate, distort, or alter the County logo — use the approved artwork or a placeholder.
5. Use Jost for heading fonts from a local bundled font file with accessible fallbacks. Use sentence case throughout the interface, per `marin-digital-standards/content-design/interface-writing.md` — not a restated rule here, the same rule.
6. Follow the user's OS light/dark preference via `prefers-color-scheme`. Never add a manual theme toggle or store a theme preference.
7. Collapse the main menu on narrow viewports with a keyboard-operable button using `aria-expanded`/`aria-controls`, per `marin-ui/docs/components.md`.
8. Build to WCAG 2.2 Level AA from the start, not as a cleanup pass — semantic controls, visible labels, proper heading order, full keyboard operability, visible focus, accessible form errors, sufficient contrast, non-color-only status indicators, reduced-motion support, accessible live regions for dynamic status. See `marin-ui/docs/accessibility-implementation.md` for the exact patterns.
9. Use `localStorage` only for small preferences; `IndexedDB` via Dexie for real records or larger structured data; include JSON export/import for any meaningful local data.

## Review checklist before accepting generated code

Whether this skill or another agent produced the code, verify before accepting it:

```text
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
The footer contains only the text MarinOS, linked to https://marincountygov.github.io/marinos/.
The text-only Feedback button is present and has no icon.
Interface headings and labels use sentence case rather than forced all caps.
Directory card titles are the links; duplicate "Open" links are absent.
WAVE testing is run from an HTTP URL, or local-file access is enabled for the extension.
Local data has export/import if meaningful.
```

For a resident-facing service specifically, also check it against `marin-digital-standards/product-design/principles.md`'s quality checklist (eligibility/requirements stated up front, one primary action per page, plain confirmation and next steps).

## Boundaries

This skill builds and reviews the *whole* app shell — it doesn't replace a focused review. For a deep pass on one dimension, use the specific skill instead: `accessibility-review` for WCAG conformance beyond this checklist, `design-review` for County visual-identity compliance, `plain-language-review` or `inclusive-language-review` for content, `digital-service-design` for a resident-facing service's task flow.
