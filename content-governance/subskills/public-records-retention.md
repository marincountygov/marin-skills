# Subskill: Public Records Retention

## Purpose
Flag content that may require public-records, retention, archival, or disposition review.

## Use when
Use this subskill for content that documents official action, public notice, resident submissions, decisions, approvals, denials, applications, hearings, appeals, policies, programs, emergencies, procurement, contracts, or public communications.

## Retention flags
Flag retention review when content includes or relates to:

- Public notices or legally required notices.
- Meeting, hearing, appeal, ordinance, or Board-facing materials.
- Program rules, eligibility, fees, forms, decisions, approvals, denials, or official instructions.
- Emergency communications or operational status updates.
- Procurement, contracts, bids, RFPs, RFQs, addenda, award notices, or vendor communications.
- Resident-submitted records or attachments.
- Content that documents an official County position, decision, policy, or action.
- Content being removed, archived, consolidated, or redirected.

## Retention review questions

1. Does this content document official County business?
2. Is it a public notice or required communication?
3. Is it part of a transaction, application, appeal, hearing, procurement, or enforcement process?
4. Is there a required retention schedule or archival process?
5. Will removal eliminate public evidence of a decision, deadline, or instruction?
6. Does the content need to remain accessible for a defined period?
7. Is there a canonical record system outside the website?

## Required output

```markdown
### Public records and retention
- Retention review required: yes/no/unknown
- Reason:
- Possible record category:
- Source of truth or system of record:
- Archival action needed before change/removal: yes/no/unknown
- Escalation recommended:
```

## Guardrails

- Do not determine final retention requirements unless the approved retention schedule is provided.
- Do not recommend deletion of content that may be a record. Recommend retention review, archiving, redirecting, or preserving a record copy first.
- Distinguish website display from the official system of record when known.
