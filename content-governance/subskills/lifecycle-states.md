# Subskill: Lifecycle States

## Purpose

Track where a content item sits in its life, from first request through retirement. For ownership assignment and review-cadence scheduling, see `ownership-and-review-cycle.md` — this subskill is the state model those fields attach to, not a replacement for them.

## Use when

Creating, migrating, auditing, revising, or retiring content, and the question is "what stage is this at and what does it need before moving to the next stage."

## Lifecycle states

- **Proposed** — requested but not validated. Check: user need, audience, purpose, owner, existing-content overlap, source of truth.
- **Planned** — validated purpose, scheduled for creation/revision. Check: content type, location, metadata, draft owner, reviewers, target publish date.
- **Draft** — being written/assembled. Check: user-centered structure, required facts, related links, metadata, review path.
- **In review** — awaiting subject-matter, editorial, legal, policy, or communications review. Check: reviewer names/roles, review due date, approval criteria, required changes.
- **Published** — live. Check: owner, publish date, last/next review date, monitoring metric.
- **Needs update** — live but inaccurate, incomplete, stale, duplicative, or misaligned. Check: risk level, required correction, owner, deadline.
- **Archived** — retained for reference, no longer active. Check: archive reason and date, replacement/redirect, records-retention considerations (see `public-records-retention.md`).
- **Retired or deleted** — removed as no longer useful, accurate, required, or maintainable. Check: deletion rationale, redirect plan if there's traffic or links, confirmation no active obligation requires it.

## Review cadence by content type

`ownership-and-review-cycle.md` organizes cadence by frequency band (monthly/quarterly/semiannual/annual/event-triggered). This is the same guidance organized by content type instead, for when that's the easier lookup:

| Content type | Typical cadence |
|---|---|
| Service page | Every 6–12 months, or when service rules change |
| Policy or requirement | At effective-date changes, or at least annually |
| High-risk public information | Every 3–6 months |
| Campaign page | Before launch, during campaign, and at campaign end |
| News item | Review for archival after the relevance window closes |
| Event | Before and immediately after the event |
| Directory or index | Every 3–6 months |
| Downloadable form | At each form, policy, or process change |

## Output format

Use alongside `ownership-and-review-cycle.md`'s output — this adds the state-specific fields:

| Field | Value |
|---|---|
| Content title | |
| Lifecycle state | |
| Update triggers | |
| Expiration or sunset trigger | |
| Archive or retirement plan | |
| Related redirects or dependencies | |
| Open issues | |

## Guardrail

Don't advance content to "Published" without the ownership fields from `ownership-and-review-cycle.md` already resolved.
