# PDF Accessibility Skill

> **Canonical requirements have moved** to [marin-digital-standards/accessibility/documents.md](https://github.com/marincountygov/marin-digital-standards/blob/main/accessibility/documents.md). This file remains the active review workflow until refactored into a task-oriented accessibility-review Skill.

Use this skill to review, create, or remediate County of Marin PDF documents so they are accessible, readable, and suitable for public distribution.

## Purpose

PDFs must not be the default format for web content. Use HTML whenever possible. Use this skill when a PDF is legally required, operationally necessary, or being remediated for accessibility.

## When to use this skill

Use this skill for:

- Public-facing PDF reports, notices, agendas, flyers, forms, packets, guides, and handouts.
- PDF remediation before publication.
- PDF-to-HTML conversion decisions.
- Review of exported PDFs from Word, InDesign, PowerPoint, or other tools.
- Accessibility checks for documents that must remain downloadable.

## Accessibility requirements

A County PDF should:

- Have a clear document title in file properties.
- Use a logical tagged reading order.
- Use real headings, lists, tables, links, and paragraphs in the tag structure.
- Include meaningful alt text for informative images.
- Mark decorative images as artifacts.
- Use descriptive link text.
- Avoid scanned-image-only pages.
- Provide searchable, selectable text.
- Use sufficient color contrast.
- Avoid conveying meaning by color alone.
- Include table headers and simple table structure.
- Identify the document language.
- Avoid security settings that interfere with assistive technology.
- Pass automated checks and receive manual review.

## Plain-language requirements

PDF content should:

- Put the most important information first.
- Use short sections and clear headings.
- Use plain, direct language.
- Explain eligibility, deadlines, fees, and next steps clearly.
- Avoid unnecessary legal, bureaucratic, or technical phrasing.
- Include a contact path for help.

## Brand requirements

PDFs should follow County visual identity standards for:

- Logo use.
- Typography.
- Color palette.
- Layout consistency.
- Department or program attribution.
- Clear ownership and publication date.

## Recommended review workflow

1. Decide whether the content should be HTML instead of PDF.
2. Confirm the source document is structured accessibly before export.
3. Export using accessibility-preserving settings.
4. Run automated accessibility checks.
5. Manually inspect reading order, tags, links, headings, tables, and alt text.
6. Confirm plain language, brand consistency, and publication readiness.
7. Publish with a clear file name, file type, and file size when linked from a web page.

## Common issues to flag

- Scanned documents without OCR.
- Untagged PDFs.
- Missing document title.
- Incorrect heading order.
- Reading order that does not match visual order.
- Tables used for layout.
- Complex tables without headers.
- Links such as “click here” or raw URLs.
- Images of text.
- Low contrast text.
- Missing language metadata.
- Forms that cannot be completed with a keyboard or screen reader.

## Output format

When reviewing a PDF, provide:

- A pass/fail accessibility summary.
- High-priority blockers.
- Medium-priority improvements.
- Plain-language issues.
- Brand or formatting issues.
- Recommended remediation steps.
- A recommendation on whether the content should be converted to HTML.
