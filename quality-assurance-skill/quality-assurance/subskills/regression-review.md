# Regression Review Subskill

## Purpose
Check whether a content, design, template, navigation, system, or workflow change accidentally degraded existing quality or functionality.

## Use this when

- A page, template, component, form, document, or workflow was updated.
- Content was migrated or converted.
- Navigation, labels, URLs, metadata, or search behavior changed.
- A bug fix, design update, or publishing change may affect existing content.

## Regression review targets

### Content integrity
- No content was lost during migration or editing.
- Headings, lists, tables, links, attachments, and embedded media remain intact.
- Dates, fees, deadlines, contacts, and instructions remain accurate.
- Canonical page relationships are preserved.

### Task continuity
- Users can still start, continue, and complete the intended task.
- Forms, buttons, payment links, download links, contact links, and confirmation steps still work.
- Error, closed, expired, unavailable, or ineligible states are still handled.

### IA and search
- URLs, redirects, page titles, metadata, snippets, breadcrumbs, navigation labels, and internal links still support findability.
- Search result behavior does not surface obsolete, duplicate, or misleading content.

### Channel and template behavior
- Layout changes do not bury critical actions.
- Reusable components still render the correct content in the correct context.
- Font and static asset behavior has not regressed: MarinOS apps still use local Open Sans/Jost assets and do not load fonts or static UI assets from external CDNs.
- Mobile and desktop experiences preserve priority information.

### Governance
- Ownership, review dates, approvals, retention notes, and emergency notice information remain attached or documented.

## Output

Provide:

- What changed.
- What was tested.
- What passed.
- Regressions found.
- Severity and fix owner.
- Retest steps.
