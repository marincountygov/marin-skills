# Content Governance Skill Package

This package provides a content-governance skill for identifying ownership, review cadence, approval needs, policy risks, privacy concerns, retention issues, and escalation paths.

## Files

- `SKILL.md` - Core workflow and routing rules.
- `subskills/approval-routing.md` - Approval and reviewer routing.
- `subskills/ownership-and-review-cycle.md` - Stewardship and review cadence.
- `subskills/lifecycle-states.md` - Tracking a content item's stage from proposed through retired.
- `subskills/editorial-calendar.md` - Scheduling, channel planning, campaign phasing.
- `subskills/public-records-retention.md` - Public-records and retention flagging.
- `subskills/legal-policy-risk.md` - Legal and policy risk triage.
- `subskills/privacy-sensitive-content.md` - Privacy-sensitive content triage.
- `subskills/procurement-and-vendor-content.md` - Procurement/vendor content governance.
- `subskills/emergency-public-notice-review.md` - Emergency and public notice review.

## Scope

This skill does not make final legal, retention, privacy, procurement, or emergency-authority determinations. It identifies likely governance issues, missing approvals, and escalation needs before content is published or changed.

## Related skills

- `content-design` - plan a new item's audience, purpose, and type before it reaches governance.
- `content-audit` - evaluate whether existing content should be kept, revised, or retired.

## History

`lifecycle-states.md` and `editorial-calendar.md` were added here from `marinskills/content-strategy`'s `content-lifecycle.md` and `editorial-calendar.md` subskills, as part of splitting that package into `content-design`, `content-governance`, and `content-audit`. Their ownership/review-cadence content that duplicated this skill's existing `ownership-and-review-cycle.md` was trimmed rather than restated. This folder itself was also flattened from the earlier `content-governance-skill/content-governance/` nested path.
