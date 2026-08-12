# Email

Newsletters, service notices, alerts, transactional messages, event invitations. Requirements live in `marin-digital-standards/accessibility/documents.md` — email shares the same underlying structure/contrast/alt-text requirements as other content, applied to a medium with unusually inconsistent rendering across clients.

## What's different about email

Email clients vary widely in what HTML/CSS they support, and many strip or ignore semantic markup more aggressively than a browser would. Treat "renders fine in one client" as insufficient evidence — the risk is concentrated in clients that don't support the same structure.

## Checks

- Logical reading order and, where the client supports it, real heading markup.
- Descriptive link text — avoid "click here" and bare URLs.
- Alt text for informative images; never an image-only email with no live text equivalent, since images are often blocked by default.
- Essential information shown in an image (a flyer, a graphic with embedded text) is repeated as live text in the body, not left to the image alone.
- Sufficient contrast, and status/urgency never conveyed by color alone.
- Readable font size and a layout that holds up on a small mobile screen without horizontal scrolling.
- A plain-text or otherwise accessible fallback when the HTML version is heavy.

## Review workflow

1. Check the subject line, sender identity, and main message for clarity.
2. Check structure: headings (where supported), links, calls to action.
3. Check image use and alt text.
4. Check contrast and mobile rendering.
5. Confirm the destination of every link is itself accessible and current — an accessible email pointing at an inaccessible or dead page is still a failure for the reader.

## Common findings

- Image-only email (a single graphic as the entire message body) with no text alternative.
- Vague or duplicated link text across multiple links in the same message.
- Contrast that fails against the email's background color/theme.
- Layout that breaks or requires horizontal scroll on mobile.

## Output format

Use the standard finding format from `SKILL.md`.
