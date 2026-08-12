# Content Governance Skill

## Purpose
Identify ownership, review cadence, approval needs, policy risks, privacy concerns, retention issues, and escalation paths for public-facing or resident-facing content.

Use this skill when a user asks to create, review, publish, revise, retire, migrate, or govern content that may require accountable ownership, formal review, policy alignment, public-records handling, privacy review, procurement review, or emergency/public-notice coordination.

See `content-design` for planning a new item's audience/purpose/type before it reaches governance, and `content-audit` for evaluating whether existing content should be kept, revised, or retired before assigning it a governance plan.

## Core outcomes
For each content item, determine:

1. **Owner** - the department, program, role, or named steward responsible for accuracy.
2. **Approver** - who must approve before publication or material change.
3. **Review cycle** - how often the content must be reviewed and what triggers earlier review.
4. **Risk level** - low, moderate, high, or urgent based on legal, policy, privacy, operational, equity, procurement, or emergency implications.
5. **Retention considerations** - whether the content may be a public record and whether archival, retention, or disposition guidance is needed.
6. **Escalation path** - who should be consulted before publishing or changing the content.
7. **Lifecycle decision** - publish, revise, consolidate, archive, retire, redirect, or escalate.

## Default workflow

### 1. Classify the content
Identify the content type, audience, department/program area, public visibility, transaction impact, and whether it affects resident rights, benefits, payments, compliance, deadlines, or legal obligations.

Route to relevant subskills:

- `subskills/approval-routing.md` for approvals and publication authority.
- `subskills/ownership-and-review-cycle.md` for stewardship and scheduled review.
- `subskills/lifecycle-states.md` for tracking what stage a content item is at, from proposed through retired.
- `subskills/editorial-calendar.md` for scheduling, channel planning, and campaign phasing.
- `subskills/public-records-retention.md` for recordkeeping, retention, and disposition concerns.
- `subskills/legal-policy-risk.md` for legal, regulatory, ordinance, policy, or rights-impacting content.
- `subskills/privacy-sensitive-content.md` for personal data, protected data, minors, health, benefits, enforcement, or account information.
- `subskills/procurement-and-vendor-content.md` for bids, solicitations, vendor references, contract language, or commercial claims.
- `subskills/emergency-public-notice-review.md` for urgent public notices, emergency operations, closures, health/safety alerts, evacuation, outage, or incident content.

### 2. Determine governance risk
Use the following triage:

- **Low risk:** informational content with stable facts and a clear owner.
- **Moderate risk:** content with deadlines, eligibility, fees, forms, service availability, or interdepartmental ownership.
- **High risk:** content affecting legal rights, benefits, enforcement, privacy, procurement, public safety, emergency operations, or official policy.
- **Urgent:** emergency notice, public safety instruction, service disruption, legally required notice, or time-sensitive correction.

High-risk and urgent content requires escalation before publication unless the user provides an approved source and the task is limited to formatting or plain-language presentation.

### 3. Establish ownership and review cadence
Every content item should have:

- Primary owner.
- Backup owner.
- Approver or approval group.
- Last reviewed date.
- Next review date.
- Review trigger conditions.
- Source of truth.
- Contact for corrections.

### 4. Check approval needs
Before recommending publication, identify whether approval is required from:

- Department/program owner.
- Communications/public information staff.
- County Counsel or legal reviewer.
- Privacy/security reviewer.
- Records management or Clerk/records staff.
- Procurement or contracting staff.
- Emergency operations/public safety leadership.
- Executive leadership or Board-facing approver.

Do not invent approval authority. If authority is unknown, mark it as `Approval owner unknown - confirm before publication`.

### 5. Identify retention and records concerns
Flag content that may need retention review, including:

- Public notices.
- Policy statements.
- Meeting, hearing, appeal, or ordinance content.
- Program rules or eligibility criteria.
- Emergency communications.
- Procurement documents.
- Forms, applications, decisions, approvals, denials, and resident-submitted records.
- Content that documents official County action or communication.

Do not provide legal determinations. State the retention concern and recommend review with the appropriate records authority.

### 6. Identify privacy-sensitive content
Flag content that collects, displays, explains, or links to personal information, account information, health information, protected status information, minors' information, enforcement information, benefits information, or case-specific data.

Recommend minimizing data collection and public exposure. Route detailed handling questions to privacy/security review.

### 7. Produce a governance recommendation
When reviewing content, return a compact governance decision with:

- Recommended action.
- Risk level.
- Required approvers.
- Owner and backup owner, if known.
- Review cadence.
- Retention flag.
- Privacy flag.
- Escalation path.
- Open questions.
- Publication readiness: `ready`, `ready after owner approval`, `needs escalation`, or `do not publish yet`.

## Output formats

### Governance review summary
Use this when reviewing a page, notice, service page, form, policy page, or major update.

```markdown
## Governance review

**Publication readiness:** ready / ready after owner approval / needs escalation / do not publish yet
**Risk level:** low / moderate / high / urgent
**Recommended action:** publish / revise / consolidate / archive / retire / redirect / escalate

### Ownership
- Primary owner:
- Backup owner:
- Approver:
- Source of truth:

### Required review
- Department/program review:
- Communications review:
- Legal/policy review:
- Privacy/security review:
- Records/retention review:
- Procurement review:
- Emergency/public notice review:

### Lifecycle
- Last reviewed:
- Next review due:
- Review cadence:
- Trigger-based review needed when:

### Risks and mitigations
- Risk:
- Mitigation:

### Open questions
- 
```

### Content governance metadata
Use this when preparing content for a CMS or inventory.

```yaml
governance:
  owner: ""
  backup_owner: ""
  approver: ""
  source_of_truth: ""
  risk_level: "low|moderate|high|urgent"
  publication_readiness: "ready|ready_after_owner_approval|needs_escalation|do_not_publish_yet"
  review_cadence: ""
  last_reviewed: ""
  next_review_due: ""
  retention_review_required: true|false
  privacy_review_required: true|false
  legal_policy_review_required: true|false
  procurement_review_required: true|false
  emergency_notice_review_required: true|false
  escalation_path: []
```

## Guardrails

- Do not give legal advice or determine legal sufficiency.
- Do not make final retention, privacy, procurement, or emergency-authority determinations unless an approved source explicitly provides the rule.
- Do not publish or recommend publication of high-risk content without naming the missing review step.
- Do not expose sensitive personal information in examples or summaries.
- Do not invent County policy, role authority, retention schedules, or approval workflows.
- Prefer `needs escalation` over unsupported certainty when the content affects rights, duties, benefits, safety, procurement, privacy, or official public notice.
