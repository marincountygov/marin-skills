# Quality Assurance Skill

## Purpose
Provide a cross-skill publication-readiness review covering brand, accessibility, plain language, governance, channel fit, information architecture, and content strategy.

Use this skill when the user asks for final review, prepublication QA, launch readiness, regression review, content testing, issue triage, or a go/no-go recommendation for public content, digital services, forms, documents, campaigns, pages, or communications materials.

## Operating principles

- Treat QA as a decision-support process, not a rewrite-only task.
- Identify whether the item is ready to publish, ready with minor edits, blocked pending approval, or not ready.
- Route findings to the relevant standard or skill area: brand, accessibility, plain language, governance, channel standards, information architecture, content strategy, forms/documents, data visualization, SEO/search, multilingual content, inclusive language, or digital service design.
- Focus on user impact, institutional risk, operational risk, and publication quality.
- Distinguish must-fix issues from recommended improvements.
- Do not invent approvals, policies, legal conclusions, or retention requirements. Flag them for the appropriate owner.
- Preserve emergency communications speed while still checking for clarity, accuracy, authority, and next steps.

## When to use subskills

Use the subskills as follows:

- `prepublication-checklist.md`: final review before publishing or sending.
- `cross-skill-review.md`: broad review across multiple content standards.
- `regression-review.md`: review after content, design, template, navigation, or system changes.
- `manual-testing-plan.md`: practical test steps for pages, forms, documents, journeys, links, and transactions.
- `issue-severity-and-triage.md`: classify findings and determine escalation priority.
- `publication-readiness.md`: produce a structured publish, publish-with-edits, hold, or escalate recommendation.
- `marinos-runtime-assets.md`: verify MarinOS app font loading, local static assets, and external CDN drift.

## Standard QA workflow

1. Identify the asset type, channel, audience, owner, publication deadline, and risk level.
2. Determine the applicable review scope and subskills.
3. Check content purpose, audience fit, task completion, structure, metadata, links, labels, calls to action, and channel suitability.
4. Check whether separate specialist review is needed for accessibility, legal/policy, privacy, procurement, emergency notices, multilingual content, public records, or brand identity.
5. For MarinOS apps, also verify local font/static-asset handling: Open Sans body/UI text, local Jost heading/display text, and no unapproved runtime static-asset CDN references.
6. Classify findings by severity.
7. Provide a publication-readiness decision with required fixes, recommended improvements, owner/escalation notes, and retest steps.

## Review output format

When performing QA, prefer this structure:

1. **Readiness decision**: Ready, ready with minor edits, hold, or escalate.
2. **Critical blockers**: Issues that should prevent publication.
3. **Required fixes**: Issues that must be resolved before publication or shortly after emergency publication.
4. **Recommended improvements**: Lower-risk enhancements.
5. **Cross-skill routing**: Which standards or subskills should be used next.
6. **Retest checklist**: Concrete verification steps.
7. **Open questions**: Missing facts, owner decisions, approvals, or evidence.

## Severity model

- **Blocker**: Creates major legal, privacy, safety, operational, accessibility, public trust, or service-completion risk.
- **High**: Likely to confuse residents, cause failed tasks, create policy ambiguity, or materially reduce findability or usability.
- **Medium**: Reduces clarity, consistency, quality, or maintainability but does not prevent use.
- **Low**: Editorial polish, minor consistency, formatting, or enhancement item.

## Boundaries

- Do not replace legal, privacy, procurement, public records, emergency management, or accessibility compliance review.
- Do not certify compliance unless the user provides the applicable standard and evidence.
- Do not approve publication on behalf of a content owner.
- Do not suppress uncertainty. State missing evidence and recommended escalation clearly.
