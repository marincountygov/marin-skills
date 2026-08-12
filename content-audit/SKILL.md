---
name: content-audit
summary: Evaluate existing content and recommend keep, revise, merge, split, move, redirect, archive, or delete.
description: Use this skill when the user asks to audit a page, section, or content inventory — evaluate usefulness, accuracy, duplication, findability, performance, and maintenance burden, and recommend a disposition.
---

# Content audit

## Core rule

Audit against user need, strategic purpose, accuracy, findability, ownership, performance, and maintenance burden — not style alone. A page can read beautifully and still fail this audit if nobody's using it or nobody owns it.

## Audit dimensions

- **User value** — Who needs this? What task does it support? What would users lose if it were removed?
- **Accuracy and currency** — Is the information current? Is the owner known? Is there a source of truth? Are dates, fees, contacts, links, and requirements current?
- **Duplication and overlap** — Does another page answer the same need better? Are there conflicting versions? Should items be merged or redirected?
- **Findability** — Is the title clear? Does it appear in the right place? Are search terms, metadata, and taxonomy appropriate? Are related pages linked?
- **Purpose and fit** — Does the content type and placement match the purpose (see `content-design/subskills/content-types.md`)? Is it in the right channel? Public, internal, archival, or campaign-specific?
- **Performance** — page views, search queries, click-throughs, form starts/completions, downloads, support contacts, feedback, bounce/exit patterns, broken links.
- **Risk and maintenance burden** — Could stale content cause service failure, legal risk, safety risk, or public confusion? Is maintenance effort justified by user value? Is the owner still available?

## Recommendation labels

- **Keep** — useful, accurate, findable, owned, aligned.
- **Revise** — still needed, but needs updates, restructuring, plain-language editing, metadata, or ownership fixes.
- **Merge** — multiple items serve the same or overlapping intent.
- **Split** — one item serves unrelated audiences, tasks, or purposes.
- **Move** — valid, but belongs in a different section, channel, or content type.
- **Redirect** — an old URL/item should point users to a better current source.
- **Archive** — no longer active but should remain available for reference, records, transparency, or history.
- **Delete** — no user value, no current purpose, no retention need identified by the responsible authority, and no meaningful traffic or dependency.

## Audit inventory fields

URL/item ID, title, content type, owner, audience, purpose, lifecycle state, last reviewed, accuracy, duplicate/overlap, performance signal, risk (low/medium/high), recommendation, priority, next action.

## Scoring model

A simple 1–3 score, when useful:

| Dimension | 1 | 2 | 3 |
|---|---|---|---|
| User value | Low or unclear | Moderate | High |
| Accuracy | Unknown or inaccurate | Partly current | Current |
| Findability | Hard to find | Somewhat findable | Easy to find |
| Ownership | Unknown | Shared or unclear | Clear owner |
| Strategic fit | Weak | Partial | Strong |
| Maintenance risk | High | Moderate | Low |

Interpretation: high value + low accuracy → prioritize revision. Low value + high maintenance burden → consider archive or delete. Duplicate high-value content → merge and redirect. Unknown owner + high-risk content → escalate before publication or continued reliance.

## Output format

**Summary table**: Recommendation, Count, Rationale, Next step — one row per recommendation label (Keep/Revise/Merge/Split/Move/Redirect/Archive/Delete).

## Decision rules

Don't delete content solely for low traffic — confirm first whether it serves a critical low-volume need. Don't keep content solely for high traffic — high traffic can indicate confusion or dependency, not success. Don't archive content users still need for active tasks. Don't merge content with different primary audiences unless the combined page can still serve each clearly. Flag legal, records, privacy, or policy retention questions for the responsible authority rather than deciding them here.

## Related skills

- `content-design` — plan or reclassify content once an audit recommends revision or a type change.
- `content-governance` — assign or update lifecycle state and review cadence for the audit's outcome.
