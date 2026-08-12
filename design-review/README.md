# Design Review Skill

A reusable AI Skill for reviewing or producing County of Marin visual assets against the brand standard.

The standard this skill applies — logo, color, typography, imagery, and medium-specific rules — is canonical in [marin-digital-standards/brand](https://github.com/marincountygov/marin-digital-standards/tree/main/brand). This skill is the review/production workflow, not a second copy of the standard.

## Files

- `SKILL.md` — workflow, review output format, asset-creation rules, boundaries.
- `subskills/logo-and-identity.md`
- `subskills/color-and-typography.md`
- `subskills/mediums.md`

## Related skills

- `accessibility-review` — for WCAG conformance; a design review and an accessibility review are separate passes.
- `content-governance` — for legal/privacy/records/procurement review needs this skill flags but doesn't perform.

## History

This skill replaces `marinskills/brand-standards` (a core `SKILL.md`, a `review-checklist.md`, and three topic subskills). The underlying identity/logo/color/typography/imagery/mediums guidance moved to `marin-digital-standards/brand` as the canonical standard; this skill is the resulting task-oriented refactor. The source package's "MarinOS web standards" interaction/component rules (menu behavior, card content, nav reset) were not part of this refactor — they're pending the product-design migration pass.
