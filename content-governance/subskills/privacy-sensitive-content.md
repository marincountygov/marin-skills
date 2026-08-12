# Subskill: Privacy-Sensitive Content

## Purpose
Identify privacy concerns in content that collects, displays, explains, transmits, stores, or links to sensitive personal information.

## Use when
Use this subskill for forms, applications, portals, reports, case-related content, account access, benefits, health, enforcement, minors, complaints, permits, payments, public records requests, or user-submitted documents.

## Privacy flags
Escalate when content includes or requests:

- Names connected to case details, status, eligibility, health, enforcement, benefits, complaints, or protected services.
- Addresses, phone numbers, email addresses, dates of birth, ID numbers, account numbers, payment details, signatures, or credentials.
- Health, behavioral health, disability, social services, benefits, immigration, housing, law enforcement, child/family, or protected status information.
- Information about minors or dependent adults.
- Uploads of documents, photos, records, or evidence.
- Public posting of resident-submitted information.
- Third-party tools, embedded forms, analytics, chat, maps, or vendor systems that collect resident data.

## Privacy review questions

1. What data is collected or displayed?
2. Is every field necessary for the stated purpose?
3. Who receives the data?
4. Where is the data stored?
5. Is the tool or vendor approved?
6. What notice is provided to the resident?
7. Could the content reveal case status, identity, protected information, or location?
8. Are there safer contact, submission, or redaction options?

## Required output

```markdown
### Privacy-sensitive content
- Privacy review required: yes/no/unknown
- Sensitive data involved:
- Collection/display risk:
- Data minimization recommendation:
- Safer wording or handling:
- Escalation path:
```

## Guardrails

- Do not include real personal data in examples.
- Do not recommend public display of sensitive resident information.
- Do not assume a third-party tool is approved.
- Route unclear privacy, security, or protected-data cases to the appropriate privacy/security reviewer.
