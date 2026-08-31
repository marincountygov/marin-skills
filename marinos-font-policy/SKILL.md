---
name: marinos-font-policy
summary: Check MarinOS app font loading and local-first runtime asset rules.
description: Use this skill when creating, reviewing, or updating MarinOS app HTML, CSS, templates, generated code, QA output, or documentation that involves fonts, CSS, JavaScript, icon sets, or static UI asset loading.
---

# MarinOS font policy

## Purpose

Keep MarinOS apps consistent, portable, and self-contained by using the shared local `marin-ui` font bundle instead of external font or static-asset CDNs.

Canonical standards live in `marin-digital-standards`; implementation lives in `marin-ui` and `marin-app-template`. This skill tells an agent how to apply those rules while generating or reviewing work.

## Before acting, consult

- `references/marinos-open-sans-and-runtime-asset-policy.md` in this repo.
- `marin-ui/shared/app-brand.css` for the implementation source of truth.
- `marin-app-template/shared/app-brand.css` for the expected template copy.
- `marin-digital-standards/brand/typography.md` and `product-design/runtime-dependencies.md` for the canonical standards language.

## Required behavior

- Use Open Sans for body and user-interface text in MarinOS apps.
- Use the shared `marin-ui`/`marin-app-template` bundle for font loading instead of writing new app-level font imports.
- Keep Open Sans at `vendor/fonts/open-sans/OpenSans-VariableFont_wdth,wght.woff2` in app/template/UI repos that ship runtime assets.
- Keep the Open Sans license at `vendor/fonts/open-sans/OFL.txt` in repos that ship the font file.
- Keep Jost as the local heading/display font when supplied by the shared bundle.
- Use shared font tokens such as `--app-font-body` rather than creating unrelated font stacks in application CSS.
- Do not add runtime font or static UI asset references to Google Fonts, Adobe Fonts, jsDelivr, unpkg, cdnjs, or similar services.

## Allowed external calls

Intentional data/API integrations are allowed when they are part of the product design and the app includes loading, failure, and recovery states. Do not classify those as font/CDN violations merely because they are external requests.

## Review workflow

1. Identify whether the work is a new app, app update, template update, shared UI change, QA review, or documentation change.
2. Check whether the work starts from `marin-app-template` or syncs from the current `marin-ui` bundle.
3. Confirm that Open Sans and Jost are supplied by local first-party files when the repo ships runtime assets.
4. Search runtime HTML, CSS, and JavaScript for external font/CDN asset references.
5. Check custom CSS for unnecessary `font-family`, `@import`, or `@font-face` rules that bypass the shared bundle.
6. Report any missing files, external static-asset calls, or standard exceptions that need human approval.

## Output format

Use this structure when reporting findings:

```text
Font status: pass / needs fix / cannot verify
Local files: present / missing / not applicable
External static assets: none / list findings
CSS drift: none / list selectors or files
Required fixes: ordered list
Open questions: missing evidence or owner decisions
```
