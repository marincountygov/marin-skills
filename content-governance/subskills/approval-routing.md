# Subskill: Approval Routing

## Purpose
Determine who needs to review or approve content before it is published, materially changed, archived, or removed.

## Use when
Use this subskill for content involving department ownership, public-facing claims, official statements, deadlines, policies, fees, forms, service availability, emergency notices, procurement, privacy, or legal obligations.

## Approval triage

### Usually owner approval only
- Routine service descriptions.
- Staff-maintained program pages.
- Simple event or office-hour updates.
- Non-policy explanatory content based on an approved source.

### Add communications review
- Homepage, campaign, news, media, executive, or public announcement content.
- Content likely to receive press or public attention.
- Cross-department messages.
- Content requiring consistent County voice or visual presentation.

### Add legal or policy review
- Rights, responsibilities, enforcement, appeals, citations, hearings, ordinances, policies, eligibility, fees, deadlines, penalties, disclaimers, public notices, or regulated services.

### Add privacy/security review
- Personal information, account information, protected data, case records, health-related information, minors, benefits, enforcement, or resident-submitted data.

### Add procurement/contracting review
- Solicitations, bids, RFP/RFQ content, vendor pages, contract requirements, addenda, award notices, vendor performance claims, or purchasing instructions.

### Add emergency/public safety review
- Closures, hazards, evacuations, shelters, outages, road impacts, incident response, public health/safety instructions, emergency resources, or time-sensitive corrections.

## Required output
Return:

```markdown
### Approval routing
- Publication readiness:
- Required approvers:
- Optional reviewers:
- Escalation required: yes/no
- Reason:
- Missing information:
```

## Decision rule
If approval authority is unclear, write: `Approval owner unknown - confirm before publication.` Do not infer final authority from department names alone.
