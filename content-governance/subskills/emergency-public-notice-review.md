# Subskill: Emergency and Public Notice Review

## Purpose
Govern time-sensitive, public-safety, emergency, closure, disruption, and legally significant public notice content.

## Use when
Use this subskill for emergency alerts, public notices, service disruptions, closures, evacuations, shelters, road impacts, outages, public health guidance, disaster recovery, incident updates, hearing notices, legal notices, urgent corrections, or operational status pages.

## Urgent-risk indicators
Treat as urgent when content:

- Tells residents to take or avoid immediate action.
- Affects life, safety, health, shelter, transportation, evacuation, access, benefits, hearings, voting, payments, or legal deadlines.
- Announces closure, reopening, cancellation, route change, outage, hazard, or emergency resource.
- Is a legally required public notice.
- Corrects previously published emergency or public notice information.

## Required checks

1. Confirm the official source of truth.
2. Confirm timestamp and update frequency.
3. Confirm affected location, audience, service, and timeframe.
4. Confirm action residents should take now.
5. Confirm what has changed since the prior update.
6. Confirm contact channel or authoritative link.
7. Confirm translation, plain language, and channel coordination needs through the appropriate separate skills or teams.
8. Confirm expiration or next-update time.

## Required output

```markdown
### Emergency/public notice review
- Urgency: routine / time-sensitive / urgent / emergency
- Public notice review required: yes/no/unknown
- Source of truth:
- Timestamp required: yes/no
- Next update or expiration:
- Resident action:
- Affected audience/location:
- Escalation path:
- Publication readiness:
```

## Guardrails

- Do not publish unverified emergency instructions.
- Do not remove or overwrite public notices without retention and approval review.
- Do not change deadlines, locations, safety instructions, or eligibility without an approved source.
- For emergency content, prioritize accuracy, timestamping, and clear next steps over style refinements.
