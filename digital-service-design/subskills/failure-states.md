# Failure States Subskill

> **Canonical requirements have moved** to [marin-digital-standards/product-design/errors-and-recovery.md](https://github.com/marincountygov/marin-digital-standards/blob/main/product-design/errors-and-recovery.md) (failure-state definitions and core rules). This file remains the active review workflow — questions, output tables, quality criteria.

## Purpose

Design clear recovery paths for service moments where residents cannot proceed, make an error, miss a requirement, receive a denial, encounter a system failure, or need human help.

## When to use

Use when creating or reviewing error messages, incomplete applications, rejected submissions, payment failures, upload failures, missed deadlines, ineligible outcomes, denied requests, broken links, unavailable services, and support paths.

## Core rules

- Name the problem plainly.
- Explain whether the resident can fix it.
- Tell the resident exactly what to do next.
- Preserve submitted information whenever possible.
- Avoid blame.
- Avoid codes without explanation.
- Provide a contact path when self-service recovery is not possible.
- Include deadlines or consequences when relevant.
- Provide alternatives when the resident is not eligible or the service is unavailable.

## Common failure states

### Ineligible
The resident does not meet one or more eligibility criteria.

Include:
- Reason, in plain language
- Alternative service or contact path
- Whether they can appeal, reapply, or update information

### Missing information
The submission lacks required fields, documents, signatures, payment, or authorization.

Include:
- What is missing
- How to provide it
- Deadline, if any
- What happens if they do not provide it

### Invalid information
The resident provided information in the wrong format or inconsistent with requirements.

Include:
- Which field or item has the problem
- Accepted format or example
- Whether saved information remains available

### Payment failure
Payment did not process, was declined, or may have been duplicated.

Include:
- Whether the service request was submitted
- Whether the resident should retry
- How to avoid duplicate payment
- Who to contact about charges

### Upload failure
A document could not be uploaded, opened, verified, or accepted.

Include:
- Accepted file types and size limits
- How to rename or resubmit
- Alternative submission method

### Deadline missed
The resident is past a filing, payment, renewal, appeal, or response deadline.

Include:
- What deadline was missed
- Whether late submission is accepted
- Whether appeal, extension, waiver, or contact is available

### Service unavailable
The system, office, form, appointment, program, or channel is temporarily unavailable.

Include:
- What is unavailable
- When it may be available, if known
- Alternative channel
- What to do for urgent needs

## Error-message pattern

Use this structure:

**[Problem]**

[Explain why this happened or what it means.]

**What to do next**

[Give one or more concrete recovery actions.]

**Need help?**

[Provide contact or support path when needed.]

## Output: failure-state table

| Failure state | Resident impact | Message needed | Recovery action | Escalation/contact |
|---|---|---|---|---|
| Ineligible |  |  |  |  |
| Missing information |  |  |  |  |
| Invalid information |  |  |  |  |
| Payment failure |  |  |  |  |
| Upload failure |  |  |  |  |
| Deadline missed |  |  |  |  |
| Service unavailable |  |  |  |  |

## Quality criteria

A failure state is ready when residents know what went wrong, whether they can fix it, what to do next, and how to get help without restarting unnecessarily.
