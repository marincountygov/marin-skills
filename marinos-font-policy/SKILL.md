---
name: marinos-font-policy
summary: Check MarinOS app font loading and local-first runtime asset rules.
description: Use this skill when creating, reviewing, or updating MarinOS app HTML, CSS, templates, generated code, QA output, or documentation that involves fonts, CSS, JavaScript, icon sets, or static UI asset loading.
---

# MarinOS font policy

## Purpose

Keep MarinOS apps consistent, portable, and self-contained by using the shared local `marin-ui` font and icon bundle instead of external font, icon, or static-asset CDNs.

Canonical standards live in `marin-digital-standards`; implementation lives in `marin-ui` and `marin-app-template`. This skill tells an agent how to apply those rules while generating or reviewing work.

## Before acting, consult

- `marin-digital-standards/brand/typography.md` and `product-design/runtime-dependencies.md` for the canonical font-policy language.
- `marin-digital-standards/brand/iconography.md` for the canonical icon-policy language (Lucide, self-hosted, one icon per app reused in header/favicon/`catalog.json`).
- `marin-ui/shared/app-brand.css` and `marin-ui/vendor/icons/lucide/` for the implementation source of truth.
- `marin-app-template/shared/app-brand.css` for the expected template copy.

## Required behavior

- Use Open Sans for body and user-interface text in MarinOS apps; Jost stays the heading/display font.
- Use the shared `marin-ui`/`marin-app-template` bundle for font and icon loading instead of writing new app-level font imports or hand-drawn one-off icons.
- Keep Open Sans at `vendor/fonts/open-sans/OpenSans-VariableFont_wdth,wght.woff2` (license at `vendor/fonts/open-sans/OFL.txt`) in app/template/UI repos that ship runtime assets.
- Use shared font tokens such as `--app-font-body` rather than creating unrelated font stacks in application CSS.
- Use Lucide icons vendored at `vendor/icons/lucide/` (license at `vendor/icons/lucide/LICENSE`) instead of new hand-drawn inline SVG. Each app has one icon, reused for its header `.app-icon`, its favicon, and its `marin-os/catalog.json` entry — not a generic icon in some of those and a distinctive one in others.
- Do not add runtime font, icon, or static UI asset references to Google Fonts, Adobe Fonts, jsDelivr, unpkg, cdnjs, or similar services.

## Allowed external calls

Intentional data/API integrations are allowed when they are part of the product design and the app includes loading, failure, and recovery states. Do not classify those as font/CDN violations merely because they are external requests.

## Review workflow

1. Identify whether the work is a new app, app update, template update, shared UI change, QA review, or documentation change.
2. Check whether the work starts from `marin-app-template` or syncs from the current `marin-ui` bundle.
3. Confirm that Open Sans and Jost are supplied by local first-party files when the repo ships runtime assets. Then confirm each font token is actually *consumed*, not just defined: `--app-font-body` must appear in a `font-family` declaration on `body` (or an equivalent catch-all selector), and `--app-font-heading` on `h1`–`h6`/`.app-title` — a token that's only set as a CSS custom property (e.g. only assigned to `--pico-font-family-sans-serif`, which the vendored `pico.min.css` build does not read) silently never renders, so grep for the selector, not just the variable definition. Where practical, verify with a rendered check (curl the deployed CSS, or load the page and inspect computed `font-family`), not just source inspection — this exact gap shipped once already (`marin-ui` 1.16.0 → 1.16.1).
4. Confirm the app has one icon reused across its header `.app-icon`, its favicon, and its `marin-os/catalog.json` entry — sourced from `vendor/icons/lucide/`, not hand-drawn or inconsistent between those three places. This applies on every icon change, not just initial registration: if an app's header/favicon icon is redrawn later, diff `catalog.json`'s `icon.markup` against the new icon too — it's a separate file in a separate repo and won't update itself. `marin-os/scripts/check-catalog-sync.js` checks id/name/url/description parity but not icon content, so this still needs a manual diff.
5. Search runtime HTML, CSS, and JavaScript for external font/icon/CDN asset references.
6. Check custom CSS for unnecessary `font-family`, `@import`, or `@font-face` rules that bypass the shared bundle.
7. Report any missing files, external static-asset calls, or standard exceptions that need human approval.

## Output format

Use this structure when reporting findings:

```text
Font status: pass / needs fix / cannot verify
Icon status: pass / needs fix / cannot verify
Local files: present / missing / not applicable
External static assets: none / list findings
CSS drift: none / list selectors or files
Required fixes: ordered list
Open questions: missing evidence or owner decisions
```
