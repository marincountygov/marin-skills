---
name: accessibility-core
description: Shared accessibility foundation for creating, reviewing, and remediating digital content against WCAG 2.2 Level AA expectations.
version: 1.0.0
default_standard: WCAG 2.2 Level AA
skill_family: accessibility
children:
  - accessibility/web
  - accessibility/pdf
  - accessibility/office-documents
  - accessibility/social-media
---

# Accessibility Core Skill

> **Canonical requirements have moved** to [marin-digital-standards/accessibility](https://github.com/marincountygov/marin-digital-standards/tree/main/accessibility) (`standard.md` covers the POUR principles, default standard, build order, and conformance language rules below). This file remains the active review workflow — severity model, scope rules, review dimensions, finding format — until it's refactored into a task-oriented `accessibility-review` Skill.

## Purpose

Use this skill whenever creating, reviewing, remediating, or advising on digital content accessibility.

This is the shared accessibility foundation for all output-specific accessibility skills, including web, PDF, DOCX, PPTX, social media, video, audio, forms, and other digital content formats.

This core skill establishes:

- baseline accessibility principles;
- default WCAG target;
- review posture;
- severity model;
- conformance language rules;
- common review dimensions;
- standard finding format;
- escalation rules;
- manual testing expectations.

Output-specific skills must extend this skill rather than redefine it.

Examples of output-specific skills:

- `accessibility/web`
- `accessibility/pdf`
- `accessibility/office-documents`
- `accessibility/social-media`
- `accessibility/video-audio`
- `accessibility/forms`
- `accessibility/email`

---

## Default Standard

Unless the user, project, policy, law, contract, or governing accessibility standard specifies otherwise, use:

**WCAG 2.2 Level AA**

Treat WCAG 2.2 Level AA as the default baseline for digital accessibility review and production.

Where another standard applies, such as Section 508, EN 301 549, ADA Title II rules, organizational policy, state law, or local government requirements, apply the stricter or more specific requirement when known.

When the governing standard is unclear, state the assumption:

> "This review assumes WCAG 2.2 Level AA as the target standard unless another policy standard applies."

---

## Relationship to Output-Specific Skills

This skill is the parent accessibility skill.

Apply this skill first, then apply the relevant output-specific skill.

For example:

- For websites and web applications, apply this skill plus `accessibility/web`.
- For PDFs, apply this skill plus `accessibility/pdf`.
- For Word documents and slide decks, apply this skill plus `accessibility/office-documents`.
- For social media content, apply this skill plus `accessibility/social-media`.
- For video or audio, apply this skill plus `accessibility/video-audio`.

Do not duplicate all core principles in child skills. Child skills should define medium-specific implementation details, tools, checks, and examples.

---

## Core Accessibility Principles

Use the WCAG POUR model as the conceptual foundation.

Digital content should be:

### Perceivable

Users must be able to perceive the information being presented.

Check for:

- text alternatives for non-text content;
- captions and transcripts;
- sufficient color contrast;
- information not conveyed by color alone;
- readable text and scalable layouts;
- adaptable structure;
- meaningful sequence;
- accessible charts, maps, images, icons, and diagrams.

### Operable

Users must be able to operate the interface or content.

Check for:

- keyboard access;
- visible focus;
- logical focus order;
- no keyboard traps;
- adequate target size and spacing;
- enough time to complete tasks;
- no flashing or seizure-inducing content;
- clear navigation;
- bypass mechanisms;
- predictable interaction behavior.

### Understandable

Users must be able to understand the information and operation.

Check for:

- plain language;
- clear headings;
- descriptive links and buttons;
- predictable navigation and interaction;
- understandable form labels and instructions;
- clear error messages;
- consistent terminology;
- defined abbreviations where needed;
- language metadata.

### Robust

Content must be compatible with current and future user agents, including assistive technologies.

Check for:

- valid semantic structure;
- programmatic names, roles, states, and values;
- compatibility with screen readers and other assistive technologies;
- correct markup or tagging;
- stable behavior across browsers, viewers, platforms, and devices.

---

## Accessibility Is Broader Than WCAG

WCAG is the baseline, not the full definition of accessibility.

When reviewing or creating content, also consider:

- cognitive accessibility;
- plain language;
- mobile usability;
- low bandwidth or older device constraints;
- multilingual or translated content;
- assistive technology compatibility;
- disability inclusion beyond technical conformance;
- usability for people with temporary, situational, or changing disabilities.

Do not treat a technical pass as proof of a good user experience.

---

## Conformance Language Rules

Be precise and conservative when discussing accessibility status.

### Do not say:

- "This is WCAG compliant."
- "This is fully accessible."
- "This passes accessibility."
- "This guarantees compliance."
- "This PDF is accessible" unless it has been properly tested.
- "No accessibility issues exist."

### Prefer:

- "This appears aligned with WCAG 2.2 AA based on the reviewed material."
- "No issues were identified in the reviewed scope, but this is not a full conformance audit."
- "This needs manual testing before a conformance claim can be made."
- "This is a potential WCAG issue."
- "This likely fails WCAG criterion..."
- "This should be remediated before publication."
- "This requires validation with assistive technology."

### Required disclaimer for incomplete reviews

If the review did not include full manual testing, state:

> "This is not a full WCAG conformance audit. Findings are based on the content and context available for review. Manual testing may identify additional issues."

### Required disclaimer for generated content

When generating new content, state or imply:

> "Generated content should be validated before publication, especially for reading order, assistive technology behavior, color contrast, document structure, captions, transcripts, and metadata."

---

## Review Posture

When reviewing accessibility, be practical, specific, and risk-oriented.

Prioritize:

1. issues that block access;
2. issues that likely violate WCAG A or AA;
3. issues that affect high-use or public-facing content;
4. issues that affect critical tasks;
5. issues that are hard to detect after publication;
6. issues that create legal, operational, or reputational risk;
7. issues that are easy to fix before publication.

Avoid vague advice such as:

- "Make this more accessible."
- "Improve contrast."
- "Use better alt text."
- "Ensure screen reader compatibility."

Instead, give actionable remediation:

- identify the affected element or content;
- explain who is affected;
- identify the likely WCAG criterion;
- explain the fix;
- explain how to verify the fix.

---

## Scope Rules

Before reviewing, determine the scope.

If scope is provided, follow it.

If scope is not provided, infer scope from the user request and state it.

Example scope statements:

- "Scope reviewed: visible page content, headings, links, form labels, and color contrast from the provided HTML."
- "Scope reviewed: document structure, headings, tables, links, alt text indicators, and plain-language risks."
- "Scope reviewed: social post text, image-description needs, hashtag readability, link clarity, and video-caption requirements."
- "Scope not reviewed: live keyboard behavior, screen reader output, PDF tag tree, and automated scan results."

Do not imply that unreviewed areas were checked.

---

## Default Review Dimensions

Use these review dimensions unless an output-specific skill provides a more detailed checklist.

### Text Alternatives

Check whether meaningful non-text content has appropriate alternatives.

Examples:

- images;
- icons;
- charts;
- maps;
- diagrams;
- buttons using only icons;
- embedded media;
- scanned documents;
- infographics.

Alt text should communicate purpose, not merely appearance.

Decorative content should be marked or handled as decorative where the format supports it.

Complex visuals may require:

- short alt text;
- nearby long description;
- data table;
- caption;
- transcript;
- appendix;
- linked accessible version.

### Structure and Semantics

Check whether structure is programmatically or structurally meaningful.

Examples:

- headings;
- lists;
- tables;
- landmarks;
- sections;
- slide titles;
- document styles;
- PDF tags;
- form groups;
- fieldsets and legends;
- reading order.

Visual formatting alone is not a substitute for semantic structure.

### Keyboard and Non-Pointer Access

For interactive content, check whether users can operate it without a mouse.

Review for:

- keyboard focus;
- focus order;
- visible focus indicator;
- keyboard traps;
- skip links or bypass mechanisms;
- modal dialogs;
- menus;
- accordions;
- custom widgets;
- drag-and-drop alternatives;
- touch target alternatives.

If keyboard behavior cannot be tested from the available artifact, mark it as requiring manual testing.

### Color and Visual Presentation

Check whether information is understandable without relying on color alone.

Review for:

- text contrast;
- icon contrast;
- focus indicator contrast;
- chart color reliance;
- error states conveyed only by color;
- required fields conveyed only by color;
- links distinguished only by color;
- text over images;
- brand color misuse.

When exact colors are unavailable, flag contrast as requiring validation.

### Forms and User Input

Check whether forms are understandable and operable.

Review for:

- visible labels;
- programmatic labels;
- instructions;
- required-field indicators;
- input purpose;
- autocomplete where appropriate;
- error identification;
- error suggestions;
- form grouping;
- accessible validation;
- confirmation and review steps for critical submissions.

### Links, Buttons, and Controls

Check whether interactive elements have clear purpose.

Review for:

- descriptive link text;
- unique link purpose where needed;
- buttons that describe the action;
- icons with accessible names;
- avoidance of "click here" or "read more" without context;
- controls that are visually and programmatically identifiable.

### Language and Readability

Check whether language is understandable for the intended audience.

Review for:

- document or page language;
- language changes within content;
- unexplained acronyms;
- jargon;
- long sentences;
- dense paragraphs;
- unclear calls to action;
- reading level concerns;
- ambiguous instructions.

Plain language is not a substitute for WCAG, but it supports accessibility.

### Media

Check whether audio and video have accessible alternatives.

Review for:

- captions;
- transcripts;
- audio description;
- text alternatives for media;
- accessible media player controls;
- autoplay;
- flashing;
- background audio;
- meaningful visual-only information.

### Motion, Animation, and Timing

Check whether users can control or avoid problematic motion or timing.

Review for:

- auto-advancing content;
- carousels;
- animated banners;
- flashing;
- parallax;
- motion-triggered effects;
- time limits;
- session expiration;
- pause, stop, hide controls.

### Tables and Data

Check whether data is structured and understandable.

Review for:

- table headers;
- header associations;
- captions or summaries;
- avoidance of layout tables;
- simple table structure where possible;
- accessible chart alternatives;
- data tables for complex visualizations.

### Documents and Downloads

When content is distributed as a file, check whether the source and exported file preserve accessibility.

Review for:

- source template;
- heading structure;
- reading order;
- metadata;
- document title;
- language;
- alt text;
- table structure;
- link text;
- bookmarks;
- tags;
- exported PDF quality;
- scanned or image-only pages.

### Compatibility

Check whether content is likely to work with assistive technologies.

Review for:

- semantic HTML or document tags;
- correct roles;
- accessible names;
- state changes;
- status messages;
- dynamic updates;
- focus management;
- platform-specific accessibility properties.

---

## Severity Model

Use the following severity model for all accessibility findings.

### Blocker

A blocker prevents some users from accessing, understanding, operating, or completing a critical task.

Examples:

- no keyboard access to a required function;
- inaccessible form submission;
- image-only document with no text alternative;
- missing captions for essential video content;
- PDF has no usable text or tag structure for required public information;
- modal traps keyboard focus;
- error messages are not perceivable.

Required handling:

- must fix before publication or release;
- escalate if publication deadline conflicts with remediation;
- identify interim accessible alternative if immediate remediation is impossible.

### High

A high-severity issue creates a substantial barrier or likely WCAG A/AA failure.

Examples:

- missing labels on important form fields;
- poor heading structure in a long public document;
- insufficient contrast for body text;
- missing alt text for informative images;
- inaccessible table structure;
- unclear error recovery;
- focus indicator not visible;
- interactive component missing accessible name.

Required handling:

- fix before publication when feasible;
- document any exception;
- retest after remediation.

### Medium

A medium-severity issue creates accessibility friction, inconsistency, or partial failure but may not fully block access.

Examples:

- vague link text where context partially helps;
- overly complex language;
- inconsistent heading levels;
- incomplete image description;
- non-critical contrast concern;
- table needs clearer caption;
- minor focus order inefficiency.

Required handling:

- fix during normal remediation;
- prioritize before broad distribution or public release.

### Low

A low-severity issue is a best-practice improvement, minor usability issue, or low-risk accessibility concern.

Examples:

- headings could be clearer;
- alt text could be more concise;
- document title could be more descriptive;
- long paragraph could be broken up;
- hashtag casing could be improved;
- redundant link wording.

Required handling:

- improve when editing;
- include in quality cleanup.

### Needs Manual Testing

Use this when the issue cannot be reliably determined from the available artifact.

Examples:

- screen reader announcement behavior;
- live keyboard navigation;
- PDF reading order;
- PDF tag tree;
- focus management in dynamic content;
- caption accuracy;
- color contrast without exact color values;
- assistive technology compatibility;
- document export quality.

Required handling:

- specify the manual test needed;
- do not mark as pass or fail without evidence.

---

## Standard Finding Format

Use this format for accessibility review findings.

```markdown
## Accessibility Review

### Summary

- Target standard:
- Scope reviewed:
- Overall assessment:
- Highest severity:
- Manual testing required:
- Not reviewed:

### Findings

#### 1. [Issue title]

- Severity:
- Affected content:
- Relevant standard or WCAG criterion:
- Issue:
- Why it matters:
- Recommended fix:
- Verification method:
- Requires manual testing: Yes/No

### Manual Testing Needed

- [Test area]&#58; - [Test area]&#58; - [Test area]&#58; 
### Recommended Next Steps

1. [Highest priority action]
2. [Next action]
3. [Validation action]
