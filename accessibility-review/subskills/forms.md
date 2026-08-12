# Forms

Any form — web, fillable PDF, or document-based — regardless of what it's built with. Requirements live in `marin-digital-standards/accessibility/forms.md`. Forms are where residents apply for services, register, pay, report, or appeal, so treat them as high-risk by default (see `SKILL.md`'s review posture).

## Review workflow

1. Identify the service goal and the task the user is trying to complete.
2. Check every field for a visible, programmatically associated label — placeholder-only labels are a finding, not a style choice.
3. Check required-field indication, help text association, and grouping (`fieldset`/`legend` for related controls).
4. Test keyboard operation and focus order end to end, not just field by field.
5. Review validation and error recovery: are errors specific, associated with the field, and does entered data survive a failed submission?
6. Confirm a confirmation message and clear next steps exist after successful submission.
7. For legal, financial, benefits, or permit submissions, confirm a review-and-confirm step exists before final submission.

## Common findings

- Placeholder used as the only label.
- Required fields marked by color/asterisk with no text explanation.
- Error message that names the problem but not the field, or isn't reachable/announced after submission.
- Form clears entered data after a validation error.
- Related radio/checkbox options with no `fieldset`/`legend`, so their shared question is never announced.
- Unnecessary time limit with no way to extend it.

## Output format

Use the standard finding format from `SKILL.md`. Report field-level issues individually — a form with the same labeling problem on twelve fields is one systemic finding, not twelve, but name where it recurs.

## Out of scope here

Whether the form asks unnecessary questions, whether its labels use plain language, and whether the field sequence matches a good service design are `plain-language-review` and `digital-service-design` concerns, not accessibility findings — note them separately if you notice them, but don't fold them into this review's severity model.
