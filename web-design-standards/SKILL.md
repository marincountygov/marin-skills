# Web Design Standards Skill

Use this skill when creating or reviewing page chrome for MarinOS web apps and documentation: the MarinOS banner, the app/document header, breadcrumbs, and the site favicon.

This skill covers page-structure and navigation conventions only. It does not cover County visual identity (colors, type, logo use — see `brand-standards`) or resident task-flow design (see `digital-service-design`).

## When to use this skill

- Adding or reviewing a header on a MarinOS app or documentation page.
- Adding breadcrumbs or nested navigation to a multi-page site (for example, a documentation collection with a landing page, a collection index, and individual documents).
- Adding or changing a favicon.
- Deciding where a utility link (view source, download, share, edit) should live on a page.

## Header contents

A header holds navigation only: the identity mark, the product or collection title, breadcrumbs, and primary navigation links (`app-nav`). It does not hold one-off utility or action links such as "View JSON-LD," "Download," "Edit this page," or "Copy link."

Put utility and document actions in the page body, near the content they act on — for example a `doc-actions` row directly under the document title (share, download HTML, download JSON) rather than in the header bar. This keeps the header's contents predictable across every page: a user should always be able to look at the header and see only "where am I and where can I go," never a mix of navigation and one-off actions.

## Header as breadcrumb

On any page nested more than one level below a product or collection root, the header must function as a breadcrumb: every ancestor level is its own link back to that level's index, and only the current level is plain (non-link) text.

Example for a document at `/marindocs/sop/2026-comprehensive-road-maintenance-operation-procedures.html`:

```html
<nav class="breadcrumb-nav" aria-label="Breadcrumb">
  <a href="../index.html">MarinDocs</a> <span aria-hidden="true">/</span>
  <a href="index.html">SOPs</a> <span aria-hidden="true">/</span>
  2026 Comprehensive Road Maintenance Operation Procedures
</nav>
```

Rules:

- "MarinDocs" links back to the documentation product root, not to the current collection.
- Each intermediate collection (for example "SOPs") links to its own index page.
- The final crumb (the current page) is plain text, not a link, so it reads clearly as "you are here."
- Do not collapse the breadcrumb into a single link that only points at one destination (for example, wrapping "MarinDocs / SOPs" in one `<a>` that only opens the collection index) — every distinct level needs its own link to its own destination.
- A single decorative icon may sit beside the breadcrumb; it should not itself be part of the link chain.

## MarinOS identity mark

The MarinOS banner and the site favicon both use the same shared MarinOS icon (the four-square mark defined in `marinappsbrand`), not a separate logo file or unrelated glyph.

- In the banner, place the icon immediately before the word "MarinOS" and color it with `currentColor` so it always matches the banner text color.
- Use the same icon as the favicon via the inline SVG data URI documented in `marinappsbrand/SPEC.md`. Do not add a separate `.ico` or PNG favicon file — this keeps the identity mark self-contained and versioned with the rest of the shared bundle.

## Boundaries

`marinappsbrand` is the implementation source of truth for the exact markup, CSS classes, and favicon data URI referenced above — cross-link to it instead of duplicating markup here. Use `brand-standards` for County color, typography, and logo-use rules, and `digital-service-design` for resident-facing task flows. This skill does not perform accessibility conformance review; hand off contrast, keyboard, and screen-reader questions to the accessibility skills.
