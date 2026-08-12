# Documents

PDF, Word, Excel, PowerPoint, Google Docs/Sheets/Slides. Requirements live in `marin-digital-standards/accessibility/documents.md` — this subskill covers how to review, test, and remediate them.

## First question: should this be a document at all?

Before reviewing a PDF, ask whether it should exist as a PDF. Recommend converting to an accessible HTML page when the content is high-value, frequently accessed, or would clearly be easier to keep accessible as a web page. Reserve PDF for genuinely fixed, printable, or offline-necessary content.

## Source-first workflow

Accessibility built into the source document survives export; accessibility patched onto an exported PDF does not.

1. Confirm the source (Word/PowerPoint/Sheets) uses built-in heading styles, real list/table markup, and descriptive file names — not manual formatting made to look like structure.
2. Export using accessibility-preserving settings.
3. Run the automated checker (Word/PowerPoint's built-in checker, or a PDF accessibility tool).
4. Manually inspect what the checker can't catch: reading order, tag structure, table headers, alt text quality, link text.
5. If exported to PDF, verify the PDF separately — a clean source document can still export badly.

## Medium-specific checks

- **Word**: heading styles used in order (not skipped for visual size); real list markup, not typed bullets; simple tables with header rows; text boxes avoided where they'd disrupt reading order; language metadata set.
- **Spreadsheets**: clear sheet names; no blank rows/columns inside a data table (breaks screen-reader table navigation); header row identified; merged cells avoided in data regions; charts have labels and a text alternative; notes explain abbreviations and data sources.
- **PowerPoint**: every slide has a unique title (even if visually hidden); reading order confirmed per slide, since PowerPoint's placeholder order and visual order can diverge; legible text size; alt text for meaningful visuals; accessible speaker notes/handouts provided when the deck itself is dense.
- **PDF**: tagged reading order matches visual order; real headings/lists/tables/links in the tag tree, not just visual formatting; decorative images marked as artifacts; searchable/selectable text (never a scanned image presented as text); security settings don't block assistive technology.

## PPTX remediation guardrails

When asked to remediate a deck automatically, safe corrections are limited to things that can't change meaning: filling in missing metadata derivable from existing content, repairing a title placeholder when visible title text already exists, applying the approved County template/theme, normalizing body text to the approved font, fixing reading order on standard placeholder-based slides, converting a bare URL to nearby descriptive text when unambiguous.

Never silently: invent alt text for a meaningful image, rewrite legal/policy/budget/emergency/public-meeting content, alter a logo, claim full accessibility compliance, or delete a slide the user didn't ask to delete. State reviewed scope, unreviewed scope, applied corrections, and remaining manual-testing needs in the report.

## Common findings

- Scanned document with no OCR — no real text at all.
- Untagged PDF, or a document title missing from file properties.
- Reading order that doesn't match visual order.
- Table used for visual layout instead of data.
- Complex table with no header association.
- Link text that's a raw URL or "click here."
- Image of text where real text would work.

## Output format

Use the standard finding format from `SKILL.md`. Include an explicit recommendation on HTML vs. PDF distribution when relevant.
