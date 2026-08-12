---
name: accessibility-review
summary: Review, test, and remediate Marin digital content and products against Marin's accessibility requirements and WCAG 2.2 Level AA.
description: Use this skill whenever creating, reviewing, remediating, or advising on accessibility for websites, web applications, documents (PDF, Word, PowerPoint), email, social media, or video/audio content. Covers review posture, severity, scope, and reporting — not the requirements themselves.
---

# Accessibility review

## Purpose

Apply this skill whenever the task is to create, review, test, or remediate content or a product against Marin's accessibility requirements.

**This skill is the review workflow. It is not where the requirements live.** The requirements — what must be true, mapped to WCAG 2.2 success criteria — are canonical in [marin-digital-standards/accessibility](https://github.com/marincountygov/marin-digital-standards/tree/main/accessibility). Consult that repo first for *what's required*; use this skill for *how to review, test, prioritize, and report on* whether it's met.

If a requirement referenced here seems to conflict with `marin-digital-standards/accessibility`, the standards repo wins — update this skill, not the other way around.

## Default standard

WCAG 2.2 Level AA, per `marin-digital-standards/accessibility/standard.md`. Where a stricter or more specific requirement applies (Section 508, ADA Title II, another governing policy), apply that instead and flag the difference. When the governing standard is unclear, state the assumption:

> "This review assumes WCAG 2.2 Level AA as the target standard unless another policy standard applies."

## Conformance language

Be precise and conservative about accessibility status — see `marin-digital-standards/accessibility/standard.md`'s conformance language policy for the underlying rule. In practice:

**Don't say:** "This is WCAG compliant." "This is fully accessible." "No accessibility issues exist."

**Prefer:** "This appears aligned with WCAG 2.2 AA based on the reviewed material." "This is a potential WCAG issue." "This requires validation with assistive technology."

Any review that didn't include full manual testing states that explicitly:

> "This is not a full WCAG conformance audit. Findings are based on the content and context available for review. Manual testing may identify additional issues."

Any newly generated content carries the same expectation — it should be validated before publication, especially for reading order, assistive technology behavior, contrast, structure, captions, and metadata.

## Review posture

Be practical, specific, and risk-oriented. Prioritize, in order:

1. Issues that block access entirely.
2. Issues that likely violate WCAG A or AA.
3. Issues affecting high-use or public-facing content.
4. Issues affecting critical tasks (applying, paying, filing, requesting help).
5. Issues hard to detect after publication.
6. Issues creating legal, operational, or reputational risk.
7. Issues that are easy to fix before publication.

Avoid vague advice ("make this more accessible," "improve contrast," "use better alt text"). Instead: identify the affected element, explain who's affected, name the likely WCAG criterion, explain the fix, explain how to verify it.

Treat public-service workflows (applying for benefits, permits, housing, tax, legal, or emergency content) as high-risk by default — see `marin-digital-standards/accessibility/standard.md`.

## Scope rules

Determine scope before reviewing. If given, follow it. If not given, infer it from the request and state it explicitly — don't imply an unreviewed area was checked.

Example: "Scope reviewed: visible page content, headings, links, form labels, and color contrast from the provided HTML. Scope not reviewed: live keyboard behavior, screen reader output, and automated scan results."

## Severity model

- **Blocker** — prevents some users from accessing, understanding, operating, or completing a critical task. Must fix before publication; escalate if a deadline conflicts with remediation.
- **High** — substantial barrier or likely WCAG A/AA failure. Fix before publication when feasible; document any exception; retest after remediation.
- **Medium** — friction, inconsistency, or partial failure that doesn't fully block access. Fix during normal remediation; prioritize before broad distribution.
- **Low** — best-practice improvement or low-risk concern. Improve when editing; include in quality cleanup.
- **Needs manual testing** — can't be reliably determined from the available artifact (screen reader announcement behavior, live keyboard nav, PDF tag tree, color contrast without exact values). Specify the test needed; never mark pass/fail without evidence.

## Standard finding format

```markdown
## Accessibility Review

### Summary
- Target standard:
- Scope reviewed:
- Overall assessment:
- Highest severity:
- Manual testing required:
- Not reviewed:

### Findings

#### 1. [Issue title]
- Severity:
- Affected content:
- Relevant standard or WCAG criterion:
- Issue:
- Why it matters:
- Recommended fix:
- Verification method:
- Requires manual testing: Yes/No

### Manual Testing Needed
- [Test area]

### Recommended Next Steps
1. [Highest priority action]
2. [Next action]
```

## Routing to subskills

Apply this skill first, then the relevant subskill for the medium:

- `subskills/web.md` — websites, web applications, HTML/CSS/JS, design-system components, automated and manual testing, framework-specific notes.
- `subskills/documents.md` — PDF, Word, PowerPoint, spreadsheets, and other downloadable/exported files.
- `subskills/email.md` — newsletters, notices, alerts, transactional email.
- `subskills/forms.md` — any form, regardless of medium (web, PDF, document-based).
- `subskills/social-media.md` — posts, captions, alt text, hashtags, video captions on social platforms.
- `subskills/video-audio.md` — video, audio, podcasts, livestreams, webinars.

Don't duplicate the requirements from `marin-digital-standards/accessibility` in a subskill — reference them. Subskills define medium-specific review checks, testing methods, common findings, and remediation guidance that the standards repo doesn't cover.

## Out of scope for this skill

Plain-language, brand, and content-design review are separate concerns with their own skills (`plain-language-review`, and brand/content skills as they're established). A single review pass may touch all of these, but don't fold plain-language or brand findings into an accessibility finding — keep them in their own section of the output, or route to the appropriate skill.
