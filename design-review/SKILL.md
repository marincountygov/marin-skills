---
name: design-review
summary: Review or create County of Marin visual assets against the brand standard — logo, color, typography, imagery, and medium-specific application.
description: Use this skill when creating, reviewing, or adapting County of Marin communications, documents, presentations, email signatures, social media assets, video end cards, diagrams, charts, print collateral, signage concepts, or other visual materials for identity/design-standard compliance.
---

# Design review

## Purpose

Apply County of Marin visual identity and design standards to a specific asset — reviewing a draft, or producing a new one.

**This skill is the review/production workflow. It is not where the standard lives.** Logo, color, typography, imagery, and medium-specific rules are canonical in [marin-digital-standards/brand](https://github.com/marincountygov/marin-digital-standards/tree/main/brand). Consult that for *what's required*; use this skill for *how to apply it to a specific asset*.

This skill intentionally excludes accessibility requirements, WCAG conformance, and remediation — see `accessibility-review` for those. A design review and an accessibility review are separate passes; don't fold one into the other's findings.

## Core behavior

- Preserve official County identity — never redraw, distort, recolor, crop, decorate, or improvise the County logo.
- Use official logo artwork when supplied. If none is supplied, describe placement and usage with a placeholder (`[Official County of Marin logo here]`) rather than fabricating one.
- Apply County color and typography guidance as design constraints, not suggestions.
- Match the medium — print, presentation, email, social, video, web, report, flyer, chart, diagram, signage — see `marin-digital-standards/brand/mediums.md`.
- Flag cases needing Public Information Office, department, legal, privacy, or brand-owner review rather than deciding them yourself.
- Never claim a generated asset is officially approved, and never invent brand colors, logo variants, seals, department marks, slogans, or lockups.

## Subskills

- `subskills/logo-and-identity.md` — logo hierarchy, placement, co-branding, department marks, social avatars, video identity.
- `subskills/color-and-typography.md` — palette application, permitted pairings, type hierarchy, charts.
- `subskills/mediums.md` — email signatures, presentations, reports/flyers, social graphics, video graphics, forms.

## Workflow

1. Identify the medium (document, presentation, social, video, email, print, signage, web, chart, diagram, or other).
2. Identify the audience and communications context.
3. Determine whether official logo artwork, department lockups, templates, photos, icons, or existing assets were supplied.
4. Apply the relevant logo, color, typography, composition, and medium-specific rules from `marin-digital-standards/brand`.
5. State any assumptions, missing assets, or approvals needed.
6. Keep accessibility findings out of this skill's output unless the user explicitly asks for a handoff to `accessibility-review`.

## Review output format

- **Overall status**: compliant, mostly compliant, needs revision, or cannot verify.
- **Identity issues**: logo, seal, department naming, co-branding, misuse, missing official files.
- **Color/type issues**: palette, hierarchy, font consistency, chart styling. (Contrast here is visual legibility only — WCAG contrast is `accessibility-review`'s job.)
- **Layout/media issues**: spacing, alignment, density, imagery, social/video/email/template fit.
- **Required fixes**: concrete edits, ordered by priority.
- **Optional improvements**: visual polish not required by the standard.
- **Out of scope**: accessibility items, routed to `accessibility-review`; legal/privacy/records/procurement items, routed to `content-governance`.

## Asset creation rules

Don't embed or distribute unofficial logo recreations. Use a placeholder when official artwork isn't supplied. Note palette colors and type choices in comments when useful. Don't claim a generated asset is officially approved.

## Boundaries

This skill doesn't perform accessibility conformance review, WCAG interpretation, PDF remediation, screen-reader/keyboard/alt-text/caption/heading-structure/focus-state review (→ `accessibility-review`), legal/records/privacy/public-notice/procurement review (→ `content-governance`), or final brand approval (a human County reviewer's call, always).
