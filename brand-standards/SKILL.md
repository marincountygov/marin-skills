# County of Marin Design Standards Skill

Use this skill when creating, reviewing, or adapting County of Marin communications, documents, presentations, email signatures, social media assets, video end cards, diagrams, charts, print collateral, signage concepts, or other visual materials.

This skill applies County of Marin identity and visual design standards. It intentionally does not include accessibility requirements, WCAG conformance rules, remediation steps, or accessibility QA checklists because those are handled by separate accessibility skills.

## Source basis

Primary source: County of Marin Identity Style Guide, prepared by L Studio, updated May 2014, as published on marincounty.gov. The public web page describes the guide as the County resource for consistent and effective use of the County logo across communications and materials.

Use the published guide as the controlling public reference for logo use, identity hierarchy, color, typography, email signatures, website logo placement, social media avatars, video branding, and related visual standards.

## Core behavior

When asked to create or review a County of Marin visual asset:

- Preserve official County identity. Do not redraw, distort, recolor, crop, decorate, or improvise the County logo.
- Use official logo artwork when the user supplies it. If no official file is supplied, describe placement and usage rather than fabricating a logo.
- Apply County color and typography guidance as design constraints.
- Match the medium: print, presentation, email, social, video, web, report, flyer, chart, diagram, or signage.
- Separate design-standard review from accessibility review. When accessibility is relevant, hand off to the applicable accessibility skill rather than duplicating requirements here.
- Flag cases that require Public Information Office, department, legal, privacy, or brand-owner review.

## Sub-skill routing

Use these sub-skills as needed:

- `subskills/logo-identity.md` for logo use, logo variants, clear space, minimum size, co-branding, department identity, social avatars, video branding, and website logo placement.
- `subskills/color-typography.md` for County color palette, font choices, type hierarchy, charts, diagrams, and print/digital approximations.
- `subskills/templates-media.md` for email signatures, slides, reports, social media, video graphics, forms, flyers, and reusable layouts.
- `subskills/review-checklist.md` for design-standard compliance review.

## Standard workflow

1. Identify the medium: document, presentation, social, video, email, print, signage, web, chart, diagram, or other.
2. Identify the audience and communications context.
3. Determine whether official logo artwork, department lockups, templates, photos, icons, or existing assets were supplied.
4. Apply the relevant logo, color, typography, composition, and medium-specific rules.
5. State any assumptions, missing assets, or approvals needed.
6. Keep accessibility findings out of this skill unless the user explicitly asks for a handoff to the accessibility skill.

## Review output format

When reviewing a draft, return:

- **Overall status:** compliant, mostly compliant, needs revision, or cannot verify.
- **Identity issues:** logo, seal, department naming, co-branding, misuse, missing official files.
- **Color/type issues:** palette, hierarchy, font consistency, contrast as visual legibility only, chart styling.
- **Layout/media issues:** spacing, alignment, density, imagery, social/video/email/template fit.
- **Required fixes:** concrete edits ordered by priority.
- **Optional improvements:** visual polish that is not required by the standard.
- **Out of scope:** accessibility items that should be reviewed by the separate accessibility skills.

## Asset creation rules

When producing design assets or code:

- Do not embed or distribute unofficial logo recreations.
- Use placeholders such as `[Official County of Marin logo here]` when official artwork is not supplied.
- Identify palette colors and type choices in comments or notes when useful.
- Do not claim that a generated asset is officially approved.
- Do not invent brand colors, logo variants, seals, department marks, slogans, or lockups.
- Do not use the County seal as a decorative replacement for the logo unless the official guide or supplied asset permits it.

## Known public design standards

Logo:

- Use the official County of Marin logo or approved variants.
- Do not recreate the logo.
- Keep clear space around the logo.
- Respect minimum size guidance.
- Use correct color variants for the background and medium.
- For department websites, the County Primary Logo belongs in the standard footer linking to the County homepage, with placement consistent with the guide.

Typography:

- Futura is used in official logo/logotype artwork.
- Arial Regular is preferred for general print body copy.
- Georgia may be used when a serif face is appropriate.
- Verdana is identified in the guide for website typography.

Color:

- Use the County palette from the public Identity Style Guide.
- Use palette colors purposefully for identity, hierarchy, and emphasis.
- Avoid arbitrary color additions when a County palette color can perform the role.
- For charts and diagrams, prefer direct labels, restrained emphasis, and a clear hierarchy.

Medium-specific standards:

- Email signatures should follow County identity guidance and avoid improvised decorations.
- Social media avatars should use the approved County treatment.
- Video graphics and end cards should preserve official identity placement and legibility.
- Templates should be treated as starting points, not permission to alter the logo.

MarinOS web standards:

- Treat the current `marinappsbrand` release as the implementation source of truth.
- Use sentence case for interface copy: buttons, form labels, and navigation-item labels. Do not use stylized all-caps text (`text-transform: uppercase`, or typing labels/headings in all capitals) unless a request specifically calls for it — all-caps is not a default emphasis or wayfinding device in this system.
- Use AP-style sentence case for every heading — page titles (`h1`), section and sub-section headings (`h2`, `h3`, ...), and card/document titles (SOP titles, product names, topic names) alike: capitalize only the first word, proper nouns, and acronyms/official names; don't capitalize ordinary words just because they're in a heading; no ending period. See `marinappsbrand/SPEC.md` for the full rule and examples. Keep this in sync across views of the same content — if a document's section/step titles also drive another rendering (e.g., a Flow view built from the same JSON-LD), update both together.
- Let light and dark presentation follow the operating-system preference. Do not add a manual theme toggle.
- Use the approved product icon beside the product title. Do not add `app-official`, `app-logotype`, `app-kicker`, `eyebrow`, or `directory-hero` treatments.
- Group the app title and subtitle with the standard Marin gold left border.
- On directory cards, make the heading the destination link and do not add a duplicate “Open” link.
- A card holds a heading and one description only — no identifier, count, section total, or "Updated" line stacked underneath — unless the request specifically asks for that metadata to be shown on the card. Metadata like that belongs on the destination page, not repeated on every card that links to it.
- Include the standard text-only Feedback control on every full page; do not place an icon in it.
- Keep the standard footer to the text `MarinOS`, linked to `https://marincountygov.github.io/marinos/`.
- Write each page's description (the `<meta name="description">` tag and any on-page summary/lede serving the same role) and every card/list-item description as one plain-language sentence at roughly a 9th-grade reading level: short sentence, common words, no jargon or acronyms the audience wouldn't already know.
- Give a landing/index-style page (product header with an `app-subtitle`, or a collection hero with an `h2`) exactly one description line. Do not stack a second lede paragraph under the hero heading that just restates the subtitle already shown above it.
- Bare `<nav>` elements do not use Pico's default `justify-content: space-between` — `marinappsbrand` resets it sitewide (`nav { justify-content: flex-start; }`) so nav content groups together by default; a component that needs its items spread apart sets `justify-content` explicitly for that one case.
- Grouped document actions (Share, Download, and similar multi-option controls) use the shared `.menu` disclosure-button component rather than a row of separate always-visible buttons once there is more than one option per action. See `marinappsbrand/SPEC.md` for the component markup.
- For header contents, breadcrumb structure, and favicon/banner-icon usage, see the separate `web-design-standards` skill.

## Boundaries

For MarinOS web apps and documentation, this skill is the policy source of truth and `marinappsbrand` is the implementation source of truth for tokens, shell markup, and reusable components. Cross-link to the current `marinappsbrand` release instead of copying its CSS or component specification into this skill.

This skill does not perform:

- Accessibility conformance review.
- WCAG interpretation.
- PDF remediation.
- Screen reader, keyboard, alt text, caption, heading-structure, reading-order, or focus-state review.
- Legal, records, privacy, public notice, or procurement review.
- Final brand approval.

When those topics arise, state that they require the appropriate separate skill or responsible County reviewer.
