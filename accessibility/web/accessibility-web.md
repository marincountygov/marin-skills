---
name: accessibility-web
description: Web-specific accessibility skill for creating, reviewing, and remediating websites, web applications, HTML, CSS, JavaScript, forms, components, and digital services against WCAG 2.2 Level AA expectations.
version: 1.0.0
skill_family: accessibility
skill_type: child
extends:
  - accessibility/core
default_standard: WCAG 2.2 Level AA
content_types:
  - websites
  - web applications
  - HTML
  - CSS
  - JavaScript
  - design systems
  - component libraries
  - forms
  - dashboards
  - transactional services
  - public web pages
  - intranet pages
  - embedded widgets
  - single-page applications
  - progressive web applications
primary_users:
  - developers
  - content designers
  - UX designers
  - accessibility reviewers
  - QA testers
  - product owners
  - digital service teams
status: draft
owner: accessibility_governance
review_cycle: annual
last_reviewed: null
children: []
related_skills:
  - accessibility/core
  - accessibility/pdf
  - accessibility/office-documents
  - accessibility/social-media
  - plain-language/core
  - brand/web
  - security/web
---

# Accessibility: Web

> **Canonical requirements have moved** to [marin-digital-standards/accessibility](https://github.com/marincountygov/marin-digital-standards/tree/main/accessibility) — `standard.md`, `wcag-2.2-mapping.md`, `keyboard.md`, `focus.md`, `forms.md`, `color-and-contrast.md`, and `testing.md` collectively cover the requirements below (HTML/CSS/JS requirements, forms, components, navigation, data, media, auth, mobile, motion, files). This file remains the active review workflow, code examples, checklists, and framework-specific notes until refactored into a task-oriented `accessibility-review` Skill.

## Purpose

Use this skill when creating, reviewing, testing, or remediating accessibility for websites, web applications, digital services, HTML, CSS, JavaScript, component libraries, design systems, forms, dashboards, embedded widgets, and browser-based interfaces.

This skill extends `accessibility/core`.

Apply `accessibility/core` first, then apply the web-specific rules in this skill.

This skill supports:

- accessible web page creation;
- accessible web application development;
- HTML/CSS/JavaScript review;
- form and workflow review;
- design-system component review;
- automated accessibility test interpretation;
- manual accessibility test planning;
- remediation guidance;
- accessibility acceptance criteria for web delivery.

---

## Default Standard

Unless the user, project, policy, law, contract, or governing accessibility standard specifies otherwise, use:

**WCAG 2.2 Level AA**

If the applicable policy specifies WCAG 2.1 AA, Section 508, EN 301 549, ADA Title II, or another requirement, apply the stated requirement and flag any meaningful difference.

When the governing standard is unclear, state the assumption:

> This web accessibility review assumes WCAG 2.2 Level AA as the target standard unless another governing policy applies.

---

## Relationship to `accessibility/core`

For MarinOS web apps and documentation, this skill supplies detailed accessibility policy and review guidance. The `marinappsbrand` repository supplies the shared implementation and technical acceptance checklist. Do not duplicate its current shell markup or CSS here.

This skill does not replace the core accessibility skill.

Use `accessibility/core` for:

- conformance language;
- severity model;
- general WCAG posture;
- accessibility principles;
- plain-language expectations;
- non-overclaiming rules;
- manual testing expectations;
- general review output format.

Use this web skill for:

- semantic HTML;
- ARIA usage;
- keyboard behavior;
- focus management;
- forms;
- dynamic content;
- responsive behavior;
- client-side routing;
- browser and assistive technology behavior;
- automated testing;
- web-specific remediation.

---

## Core Web Accessibility Position

Build accessible web content from the foundation up.

Preferred order:

1. Use correct native HTML.
2. Use clear content and labels.
3. Use CSS without destroying semantics or operability.
4. Use JavaScript progressively and responsibly.
5. Use ARIA only when native semantics are insufficient.
6. Test with keyboard.
7. Test with automated tools.
8. Test manually with assistive technology where risk warrants it.

Do not use ARIA to compensate for avoidable HTML problems.

If a native HTML element provides the required semantics and behavior, use it instead of a custom element with ARIA.

Examples:

- Use `<button>` for actions.
- Use `<a href="...">` for navigation.
- Use `<label>` for form labels.
- Use `<fieldset>` and `<legend>` for related form controls.
- Use semantic headings rather than styled `<div>` elements.
- Use native form validation carefully and accessibly.
- Use `<details>` and `<summary>` when they meet the interaction need.

---

## Web Content and Application Scope

This skill applies to both static content and interactive applications.

### Static web content

Examples:

- public information pages;
- meeting pages;
- service descriptions;
- news items;
- landing pages;
- policy pages;
- help pages;
- embedded documents;
- web articles.

Primary risks:

- poor heading structure;
- vague links;
- missing image alternatives;
- low contrast;
- inaccessible tables;
- inaccessible embedded media;
- unclear reading order;
- reliance on PDFs where HTML would be better.

### Web applications

Examples:

- permit systems;
- benefits applications;
- appointment scheduling;
- payment flows;
- dashboards;
- staff portals;
- search interfaces;
- case-management interfaces;
- account-management flows.

Primary risks:

- keyboard traps;
- focus loss;
- inaccessible custom controls;
- missing form labels;
- error messages not announced;
- dynamic updates not communicated;
- modals and overlays that fail assistive technology users;
- session timeouts;
- inaccessible authentication flows;
- inaccessible file uploads;
- inaccessible data visualizations.

### Design systems and component libraries

Examples:

- buttons;
- alerts;
- accordions;
- tabs;
- menus;
- modals;
- cards;
- form components;
- date pickers;
- search filters;
- pagination;
- table components;
- toast messages;
- navigation patterns.

Primary risks:

- inaccessible pattern copied across many products;
- component appears accessible in isolation but fails in context;
- ARIA roles without required keyboard behavior;
- visual state not reflected programmatically;
- insufficient focus management;
- poor responsive behavior.

---

## Web Accessibility Production Rules

When generating or modifying web code, follow these rules.

### Rule 1: Start with semantic HTML

Use HTML elements according to their intended meaning.

Prefer:

```html
<header>
  <nav aria-label="Main navigation">
    <ul>
      <li><a href="/services">Services</a></li>
      <li><a href="/departments">Departments</a></li>
    </ul>
  </nav>
</header>

<main>
  <h1>Apply for a Building Permit</h1>
  <p>Use this service to submit a building permit application.</p>
</main>
```

Avoid:

```html
<div class="header">
  <div class="nav">
    <div onclick="location.href='/services'">Services</div>
  </div>
</div>

<div class="main-title">Apply for a Building Permit</div>
```

### Rule 2: Preserve heading hierarchy

Use headings to represent structure, not visual size.

Requirements:

- one clear page-level `<h1>` unless the application architecture justifies otherwise;
- headings should not skip levels for visual reasons;
- headings should describe the section that follows;
- do not use headings for decorative emphasis;
- do not use bold text as a substitute for headings.

Acceptable:

```html
<h1>Business License Renewal</h1>
<h2>Before You Start</h2>
<h2>Required Documents</h2>
<h3>Proof of Insurance</h3>
<h2>Submit Your Renewal</h2>
```

Problematic:

```html
<h1>Business License Renewal</h1>
<h4>Before You Start</h4>
<div class="big-bold">Required Documents</div>
```

### Rule 3: Use landmarks intentionally

Use landmarks to help users navigate.

Expected landmarks:

- `<header>` for site or page header;
- `<nav>` for navigation areas;
- `<main>` for primary content;
- `<aside>` for complementary content;
- `<footer>` for footer;
- `<form>` for forms where appropriate.

When multiple landmarks of the same type exist, provide accessible names.

Example:

```html
<nav aria-label="Main navigation">...</nav>
<nav aria-label="Utility navigation">...</nav>
<nav aria-label="Breadcrumb">...</nav>
```

### Rule 4: Prefer native controls

Use native controls unless there is a documented reason not to.

Prefer:

```html
<button type="button">Save application</button>
```

Avoid:

```html
<div role="button" tabindex="0" onclick="saveApplication()">Save application</div>
```

A custom control must provide:

- semantic role;
- accessible name;
- keyboard operation;
- visible focus;
- correct state;
- expected keyboard interaction;
- assistive technology compatibility.

If those cannot be guaranteed, use the native element.

### Rule 5: Use ARIA cautiously

ARIA can improve accessibility when used correctly, especially for dynamic content and advanced UI controls. Misused ARIA can make accessibility worse.

Use ARIA only when:

- native HTML does not provide the required semantics;
- the ARIA pattern is understood;
- keyboard behavior is implemented;
- state changes are updated correctly;
- the result is tested.

Common appropriate uses:

```html
<button aria-expanded="false" aria-controls="filter-panel">
  Show filters
</button>

<div id="filter-panel" hidden>
  ...
</div>
```

```html
<div role="status" aria-live="polite">
  Your application has been saved.
</div>
```

Avoid:

```html
<button role="heading" aria-level="2">Submit</button>
```

```html
<div role="button">Submit</div>
```

```html
<a role="button" href="/download">Download report</a>
```

unless the behavior truly matches the role and has been tested.

### Rule 6: Do not remove accessibility affordances

Do not remove browser or platform accessibility behavior without replacing it with an accessible equivalent.

Avoid:

```css
*:focus {
  outline: none;
}
```

Acceptable only if a clearly visible replacement is provided:

```css
:focus-visible {
  outline: 3px solid currentColor;
  outline-offset: 2px;
}
```

Do not disable:

- zoom;
- text resizing;
- focus indicators;
- form labels;
- keyboard access;
- browser autocomplete where appropriate;
- native error semantics without replacement.

### Rule 7: Make progressive enhancement the default

Where possible, core content and tasks should remain available when JavaScript fails or loads slowly.

At minimum:

- server-render critical content where feasible;
- provide fallback messaging for failed dynamic content;
- avoid hiding essential content until JavaScript initializes;
- ensure forms fail safely and accessibly;
- do not require pointer gestures for critical actions;
- preserve URL and navigation semantics.

### Rule 8: Treat public-service workflows as high risk

For government, healthcare, housing, benefits, legal, emergency, tax, permit, or public-meeting content, accessibility barriers may block civic participation or access to services.

Treat the following as high-risk:

- applying for services;
- submitting forms;
- paying fees;
- scheduling appointments;
- filing complaints;
- requesting accommodations;
- accessing emergency information;
- reviewing public notices;
- viewing meeting agendas or minutes;
- searching public records;
- downloading required documents.

---

## HTML Requirements

### Page title

Each page or route should have a unique, meaningful title.

Good:

```html
<title>Apply for a Building Permit | County Services</title>
```

Bad:

```html
<title>Home</title>
```

For single-page applications, update the document title when the route changes.

### Language

Set the page language.

```html
<html lang="en">
```

For content in another language, mark the language change where feasible.

```html
<p lang="es">Solicitud de permiso</p>
```

### Main content

Provide a clear main region.

```html
<main id="main-content">
  <h1>Request a Public Record</h1>
  ...
</main>
```

### Skip link

Provide a skip link when repeated navigation precedes main content.

```html
<a class="skip-link" href="#main-content">Skip to main content</a>
```

Ensure the skip link is visible when focused.

### Lists

Use list markup for lists.

Good:

```html
<ul>
  <li>Proof of identity</li>
  <li>Completed application</li>
  <li>Payment receipt</li>
</ul>
```

Bad:

```html
<p>- Proof of identity<br>- Completed application<br>- Payment receipt</p>
```

### Tables

Use tables for data, not layout.

Good:

```html
<table>
  <caption>Permit fees by project type</caption>
  <thead>
    <tr>
      <th scope="col">Project type</th>
      <th scope="col">Fee</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Residential remodel</td>
      <td>$250</td>
    </tr>
  </tbody>
</table>
```

Avoid tables for visual layout.

---

## CSS Requirements

### Color contrast

Text and meaningful graphics must meet applicable contrast expectations.

When exact color values are available:

- verify contrast numerically;
- check normal text;
- check large text;
- check icons and graphical controls;
- check focus indicators;
- check text over images;
- check disabled-looking but active controls.

When exact values are unavailable, flag contrast for validation.

### Do not rely on color alone

Do not communicate status only through color.

Bad:

```html
<p><span class="red-dot"></span> Required</p>
```

Better:

```html
<p><span aria-hidden="true" class="required-icon">*</span> Required field</p>
```

For charts, use:

- text labels;
- patterns;
- direct labeling;
- shapes;
- data tables;
- legends that do not rely on color alone.

### Responsive and reflow behavior

Content should remain usable when:

- viewport width is narrow;
- text is resized;
- page is zoomed;
- browser font settings change;
- orientation changes;
- system text scaling is increased.

Avoid:

- fixed-height containers that clip text;
- horizontal scrolling for normal text content;
- absolute positioning that disrupts reading order;
- text rendered as images;
- overlays that obscure content when zoomed;
- components that only work at desktop widths.

### Visibility and hidden content

Use hiding techniques carefully.

Use `hidden` or `display: none` only when content should be unavailable to all users.

Use visually-hidden utility classes only when content should be available to assistive technology but not visually displayed.

Example:

```css
.visually-hidden {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  white-space: nowrap;
  border: 0;
  clip-path: inset(50%);
}
```

Do not put focusable elements inside hidden containers.

---

## JavaScript Requirements

### Keyboard support

All interactive functionality must be operable with a keyboard.

Check:

- Tab;
- Shift+Tab;
- Enter;
- Space;
- Escape;
- Arrow keys where expected;
- Home/End where expected;
- focus movement into and out of components.

If using a known ARIA pattern, implement its expected keyboard behavior.

### Focus management

Manage focus deliberately when JavaScript changes the interface.

Required patterns:

- move focus into modal dialogs when opened;
- return focus to the triggering control when dialogs close;
- move focus to meaningful content after route changes when appropriate;
- do not unexpectedly move focus while the user is typing or reading;
- ensure focus is not lost after dynamic updates;
- ensure focus order follows visual and logical order.

### Dynamic updates

Communicate important dynamic changes.

Examples:

- form error summary appears;
- search results update;
- item is added to cart or application;
- save succeeds or fails;
- session warning appears;
- filter results change;
- upload completes.

Use appropriate mechanisms:

```html
<div role="status" aria-live="polite" id="status-message"></div>
```

For urgent errors:

```html
<div role="alert">
  Your session will expire in 2 minutes.
</div>
```

Do not overuse live regions. Excessive announcements can make the experience unusable.

### Single-page applications

For SPAs and client-side routing:

- update the document title on route change;
- provide a meaningful heading for each route;
- manage focus after navigation;
- ensure browser back/forward behavior works;
- expose loading and error states accessibly;
- preserve semantic links where navigation occurs;
- avoid route changes that screen reader users cannot detect.

### Loading states

Loading indicators should be perceivable.

Include:

- visible loading message;
- programmatic status where appropriate;
- timeout or error recovery;
- no indefinite spinner without explanation.

Example:

```html
<div role="status" aria-live="polite">
  Loading permit records...
</div>
```

---

## Forms

Forms are high-risk and require detailed review.

### Labels

Every input needs a visible and programmatic label.

Good:

```html
<label for="email">Email address</label>
<input id="email" name="email" type="email" autocomplete="email">
```

Bad:

```html
<input name="email" placeholder="Email address">
```

Placeholders are not labels.

### Required fields

Indicate required fields in text, not color alone.

```html
<label for="first-name">First name <span aria-hidden="true">*</span></label>
<input id="first-name" name="first-name" required aria-describedby="required-note">
<p id="required-note">Fields marked with an asterisk are required.</p>
```

### Help text

Associate help text programmatically.

```html
<label for="account-number">Account number</label>
<p id="account-number-help">Enter the 10-digit number shown on your bill.</p>
<input id="account-number" name="account-number" aria-describedby="account-number-help">
```

### Error messages

Errors must be:

- visible;
- specific;
- associated with the field;
- summarized for long forms;
- announced or reachable after submission;
- written in plain language.

Example:

```html
<div role="alert" id="form-errors">
  <h2>There are 2 problems with your application</h2>
  <ul>
    <li><a href="#email">Enter an email address.</a></li>
    <li><a href="#phone">Enter a 10-digit phone number.</a></li>
  </ul>
</div>

<label for="email">Email address</label>
<input id="email" name="email" type="email" aria-invalid="true" aria-describedby="email-error">
<p id="email-error">Enter an email address, such as name@example.com.</p>
```

### Groups of controls

Use `fieldset` and `legend` for related controls.

```html
<fieldset>
  <legend>How would you like to be contacted?</legend>

  <label>
    <input type="radio" name="contact-method" value="email">
    Email
  </label>

  <label>
    <input type="radio" name="contact-method" value="phone">
    Phone
  </label>
</fieldset>
```

### Autocomplete

Use appropriate `autocomplete` attributes for common personal information when relevant.

Examples:

```html
<input id="given-name" name="given-name" autocomplete="given-name">
<input id="family-name" name="family-name" autocomplete="family-name">
<input id="email" name="email" autocomplete="email">
<input id="postal-code" name="postal-code" autocomplete="postal-code">
```

### Critical submissions

For legal, financial, benefits, permit, public-record, or other critical workflows, provide review and correction before final submission where appropriate.

---

## Links and Buttons

### Links

Use links for navigation.

Good:

```html
<a href="/permits/apply">Apply for a permit</a>
```

Avoid vague link text:

```html
<a href="/permits/apply">Click here</a>
```

### Buttons

Use buttons for actions.

Good:

```html
<button type="submit">Submit application</button>
<button type="button">Add another address</button>
```

Bad:

```html
<a href="#" onclick="submitForm()">Submit application</a>
```

### Repeated links

If repeated links have the same visible text but different destinations, clarify the accessible purpose.

Problematic:

```html
<a href="/agendas/2026-05-01">View agenda</a>
<a href="/agendas/2026-05-08">View agenda</a>
```

Better:

```html
<a href="/agendas/2026-05-01">View agenda for May 1, 2026</a>
<a href="/agendas/2026-05-08">View agenda for May 8, 2026</a>
```

---

## Images, Icons, and SVG

### Informative images

Provide meaningful alt text.

```html
<img src="service-center.jpg" alt="County service center front entrance on Civic Center Drive">
```

### Decorative images

Use empty alt text.

```html
<img src="decorative-border.svg" alt="">
```

### Functional images

Describe the action.

```html
<button type="submit">
  <img src="search.svg" alt="">
  Search
</button>
```

or:

```html
<button type="submit" aria-label="Search">
  <svg aria-hidden="true" focusable="false">...</svg>
</button>
```

### SVG

For decorative SVG:

```html
<svg aria-hidden="true" focusable="false">...</svg>
```

For meaningful SVG, provide an accessible name and test it.

```html
<svg role="img" aria-labelledby="chart-title">
  <title id="chart-title">Permit applications increased from 2022 to 2025</title>
  ...
</svg>
```

For complex charts, provide a nearby text summary and data table.

---

## Components and Interaction Patterns

### Accordions

Requirements:

- use a `<button>` for each accordion trigger;
- expose expanded/collapsed state with `aria-expanded`;
- associate trigger and panel with `aria-controls` where useful;
- preserve keyboard access;
- ensure hidden content is not focusable.

Example:

```html
<h2>
  <button type="button" aria-expanded="false" aria-controls="fees-panel">
    Permit fees
  </button>
</h2>
<div id="fees-panel" hidden>
  <p>Fees vary by project type.</p>
</div>
```

### Modal dialogs

Requirements:

- focus moves into the dialog when opened;
- focus is contained inside while open;
- Escape closes the dialog unless there is a documented reason not to;
- focus returns to the triggering element when closed;
- background content is inert or unavailable to assistive technology;
- dialog has an accessible name;
- close button has an accessible name.

Example:

```html
<div role="dialog" aria-modal="true" aria-labelledby="dialog-title">
  <h2 id="dialog-title">Confirm submission</h2>
  <p>Submit your application now?</p>
  <button type="button">Submit application</button>
  <button type="button">Cancel</button>
</div>
```

### Tabs

Requirements:

- use correct roles only when implementing the full tabs pattern;
- support expected keyboard behavior;
- expose selected state;
- associate tabs with panels;
- ensure panel content is reachable.

If the content does not need true tab behavior, use headings, links, or accordions instead.

### Menus

Do not use ARIA menu roles for normal site navigation unless implementing application-style menu behavior.

For site navigation, prefer semantic navigation:

```html
<nav aria-label="Main navigation">
  <ul>
    <li><a href="/services">Services</a></li>
    <li><a href="/departments">Departments</a></li>
  </ul>
</nav>
```

### Alerts and status messages

Use alerts and status messages only when appropriate.

- `role="status"` for polite updates;
- `role="alert"` for urgent messages;
- visible text for all users;
- avoid repeated or noisy announcements.

### Toasts

Toasts must not be the only place important information appears.

Requirements:

- visible long enough to read;
- keyboard accessible if interactive;
- announced where appropriate;
- not disruptive;
- persistent alternative for critical errors.

---

## Navigation and Search

### Navigation

Navigation should be:

- consistent;
- keyboard accessible;
- semantically marked;
- available at different viewport sizes;
- named when multiple navigation regions exist.

### Breadcrumbs

Use a named navigation region.

```html
<nav aria-label="Breadcrumb">
  <ol>
    <li><a href="/">Home</a></li>
    <li><a href="/permits">Permits</a></li>
    <li aria-current="page">Apply</li>
  </ol>
</nav>
```

### Search

Search forms should include:

- visible label;
- meaningful button text;
- accessible results count;
- clear empty state;
- accessible filters;
- preserved query state where appropriate.

Example:

```html
<form role="search">
  <label for="site-search">Search county services</label>
  <input id="site-search" name="q" type="search">
  <button type="submit">Search</button>
</form>
```

### Pagination

Pagination should be marked as navigation and indicate current page.

```html
<nav aria-label="Search results pages">
  <a href="?page=1">Page 1</a>
  <a href="?page=2" aria-current="page">Page 2</a>
  <a href="?page=3">Page 3</a>
</nav>
```

---

## Data, Charts, Maps, and Dashboards

Data-heavy interfaces require additional review.

### Data tables

Requirements:

- caption or clear heading;
- column and row headers where needed;
- simple structure where possible;
- sortable controls are buttons;
- sort state is conveyed visually and programmatically;
- filters are labeled;
- pagination is accessible;
- empty states are clear;
- exports are accessible or accompanied by accessible alternatives.

### Charts

Charts should include:

- text summary of the key point;
- accessible name;
- data table where appropriate;
- non-color distinctions;
- labels and units;
- explanation of abbreviations;
- keyboard access if interactive.

### Maps

Maps require accessible alternatives.

Provide:

- text equivalent;
- address list;
- searchable/filterable list;
- table of locations;
- route or contact alternatives where relevant.

Do not make critical information available only through an interactive map.

### Dashboards

Dashboards should support:

- keyboard navigation;
- clear headings;
- accessible cards and charts;
- text summaries;
- table alternatives;
- user-controlled updates;
- understandable status and alerts.

---

## Media and Embedded Content

### Video

Check for:

- captions;
- transcript;
- audio description where meaningful visual information is not in the audio;
- accessible player controls;
- no autoplay with sound unless user initiated;
- keyboard access;
- visible focus.

### Audio

Check for:

- transcript;
- accessible player controls;
- no autoplay unless justified and controllable.

### Iframes and embeds

Requirements:

- meaningful `title`;
- keyboard accessibility;
- focus behavior tested;
- accessible fallback if third-party embed is inaccessible;
- no critical task delegated to an inaccessible embed without an alternative.

Example:

```html
<iframe
  src="https://example.com/map"
  title="Map of county service locations">
</iframe>
```

---

## Authentication, Sessions, and Security UX

Accessibility applies to authentication and security flows.

Check:

- login forms have labels and error messages;
- password requirements are clear before submission;
- password managers and paste are not blocked without a documented reason;
- MFA flows are accessible;
- CAPTCHA has an accessible alternative;
- timeout warnings are perceivable and actionable;
- users can extend sessions where appropriate;
- account lockout messages are understandable;
- recovery flows are accessible.

Do not use inaccessible CAPTCHA as the only verification path.

---

## Mobile and Touch Accessibility

Check responsive and touch behavior.

Requirements:

- content reflows without loss of information;
- controls have adequate target size and spacing;
- orientation is not unnecessarily restricted;
- gestures have alternatives;
- hover-only content is also available by keyboard and touch;
- mobile navigation is keyboard accessible;
- focus is visible in responsive menus;
- zoom is not disabled.

Avoid:

```html
<meta name="viewport" content="user-scalable=no">
```

Prefer:

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

---

## Motion, Animation, and Timing

Check for:

- autoplay;
- carousels;
- auto-advancing content;
- flashing;
- parallax;
- scroll-jacking;
- animated transitions;
- time limits;
- session expiration.

Provide controls to pause, stop, hide, extend, or disable where required.

Respect user preferences:

```css
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms;
    animation-iteration-count: 1;
    transition-duration: 0.01ms;
    scroll-behavior: auto;
  }
}
```

Use this pattern carefully so it does not break meaningful state transitions.

---

## Files and Downloads from Web Pages

When linking to files:

- identify file type and size where useful;
- avoid making PDFs the only access path when HTML would be more accessible;
- provide accessible source or HTML equivalent for high-value content;
- ensure link text describes the document;
- do not rely on scanned image-only documents;
- flag public PDFs for separate PDF accessibility validation.

Example:

```html
<a href="/documents/budget-summary.pdf">
  Download the budget summary PDF
</a>
```

Better when possible:

```html
<a href="/budget-summary">Read the budget summary online</a>
<a href="/documents/budget-summary.pdf">Download the budget summary PDF</a>
```

---

## Automated Testing Guidance

Use automated testing as part of review, not as proof of conformance.

Recommended automated checks may include:

- axe-core;
- Lighthouse accessibility audit;
- WAVE;
- Pa11y;
- Accessibility Insights;
- eslint-plugin-jsx-a11y;
- HTML validator;
- design-system component tests;
- Playwright or Cypress accessibility scans;
- color contrast tooling;
- browser dev tools accessibility tree inspection.

### WAVE browser-extension testing

For local MarinOS pages, serve the repository over HTTP (for example, `python3 -m http.server 8000`) and test the `http://localhost:8000/` URL. A page opened directly with `file://` can gray out when the browser has not granted WAVE access to local files; if direct-file testing is required, enable local-page access in the extension settings.

Treat WAVE findings as automated review input, not a conformance result. Do not say that a page “passes WAVE” or is accessible solely because WAVE reports no errors. Complete keyboard, zoom/reflow, contrast, semantics, and appropriate assistive-technology checks separately.

Automated tools are useful for detecting many common issues, including:

- missing form labels;
- missing image alt attributes;
- empty buttons;
- empty links;
- some color contrast failures;
- invalid ARIA attributes;
- missing document language;
- duplicate IDs;
- some landmark issues;
- some heading issues.

Automated tools cannot prove:

- keyboard usability;
- logical focus order;
- meaningful alt text;
- screen reader comprehension;
- correct reading sequence;
- clear instructions;
- caption accuracy;
- plain language;
- accessible workflow completion;
- whether ARIA behavior matches user expectations;
- whether dynamic updates are understandable;
- whether a custom component is genuinely usable.

When reporting automated test results:

- identify the tool and version if known;
- identify scope;
- distinguish violations, warnings, and manual checks;
- prioritize results by user impact;
- do not paste raw tool output without interpretation;
- explain how to remediate;
- recommend manual testing for unresolved risk.

---

## Manual Testing Requirements

Manual testing is required for meaningful web accessibility review.

### Minimum keyboard test

Test with keyboard only:

1. Load the page.
2. Press Tab through all interactive elements.
3. Confirm focus is visible.
4. Confirm focus order is logical.
5. Confirm all controls can be reached.
6. Confirm all controls can be operated.
7. Confirm Shift+Tab works.
8. Confirm Escape works for modals, menus, and overlays where expected.
9. Confirm no keyboard trap exists.
10. Confirm focus returns appropriately after closing overlays.

### Minimum screen reader spot check

When required by risk, test with at least one common screen reader and browser combination.

Check:

- page title;
- heading structure;
- landmarks;
- links;
- buttons;
- form labels;
- error messages;
- dynamic updates;
- modal behavior;
- route changes;
- table navigation;
- chart or image alternatives.

Do not claim screen reader support without testing.

### Zoom and reflow test

Check at:

- 200% browser zoom;
- narrow viewport;
- increased text size where feasible;
- mobile viewport.

Verify:

- no loss of content;
- no overlapping text;
- no clipped controls;
- no horizontal scrolling for normal text content unless unavoidable;
- interactive elements remain usable.

### Color and contrast test

Check:

- body text;
- headings;
- links;
- buttons;
- disabled-looking active controls;
- icons;
- focus indicators;
- error states;
- charts;
- text over images.

### Workflow test

For task-based applications, test at least one full critical workflow.

Examples:

- create account;
- sign in;
- search;
- complete form;
- upload file;
- correct errors;
- review submission;
- submit;
- receive confirmation;
- download receipt.

---

## Web Review Checklist

Use this checklist when reviewing a web page, application, component, or template.

### Page and structure

- Page has a meaningful title.
- Page or route has a clear `<h1>`.
- Headings are hierarchical and descriptive.
- Main content is marked with `<main>`.
- Repeated navigation can be bypassed.
- Landmarks are used correctly.
- Multiple landmarks of the same type are named.
- Language is set.
- Reading order is logical.

### Content

- Text is clear and understandable.
- Links are descriptive.
- Buttons describe their action.
- Images have appropriate alternatives.
- Complex visuals have summaries or data alternatives.
- Tables are used for data, not layout.
- Required documents or downloads are identified.
- Critical information is not only in images, color, audio, video, or PDF.

### Visual design

- Text contrast meets target.
- Non-text contrast meets target where applicable.
- Focus indicator is visible.
- Color is not the only cue.
- Text can resize and reflow.
- Layout works on mobile.
- Motion is controllable or respects reduced-motion settings.

### Interaction

- All functionality works with keyboard.
- Focus order is logical.
- No keyboard trap exists.
- Modals manage focus correctly.
- Menus are keyboard accessible.
- Accordions expose expanded/collapsed state.
- Dynamic updates are communicated.
- Time limits are avoidable, extendable, or clearly communicated.

### Forms

- Every field has a visible label.
- Help text is associated.
- Required fields are clear.
- Error messages are specific.
- Errors are associated with fields.
- Error summary is provided for long forms.
- Users can review and correct critical submissions.
- Autocomplete is used where appropriate.

### Technical implementation

- Native HTML is used where possible.
- ARIA is valid and necessary.
- Custom controls implement expected keyboard behavior.
- Accessible names are correct.
- States and properties update dynamically.
- IDs are unique.
- Hidden content is handled correctly.
- No focusable elements are hidden from users.
- Browser defaults are not broken without replacement.

### Testing

- Automated scan completed or recommended.
- Keyboard test completed or recommended.
- Screen reader test completed or recommended.
- Zoom/reflow test completed or recommended.
- Color contrast validated or flagged.
- Critical workflows tested or flagged.

---

## Web Production Checklist

Use this checklist when generating web code or web content.

### Before writing code

- Identify the page or component purpose.
- Identify the user task.
- Identify whether the content is static or interactive.
- Identify whether the content is public-facing or high-risk.
- Identify required standards or policy constraints.
- Prefer existing accessible design-system components.

### While writing code

- Use semantic HTML.
- Use native controls.
- Add labels and instructions.
- Use descriptive links and buttons.
- Preserve keyboard access.
- Preserve visible focus.
- Avoid color-only meaning.
- Include accessible error handling.
- Include status messages for dynamic updates.
- Use ARIA only when necessary.
- Keep content readable and plain.
- Ensure responsive behavior.
- Avoid inaccessible third-party embeds.

### Before final output

- Check heading structure.
- Check landmarks.
- Check labels.
- Check alt text.
- Check link and button purpose.
- Check focus behavior.
- Check color contrast where values are available.
- Check responsive behavior.
- Identify manual testing still required.
- Avoid unsupported compliance claims.

---

## Component Acceptance Criteria

Use these acceptance criteria for reusable components.

A web component is not ready for reuse unless:

- it has semantic structure;
- it has an accessible name where needed;
- it supports keyboard interaction;
- it has visible focus;
- it exposes state programmatically;
- it supports disabled, error, active, selected, expanded, collapsed, and loading states as applicable;
- it works at narrow widths;
- it works with text resizing;
- it does not rely on color alone;
- it has documented accessibility behavior;
- it includes examples of correct and incorrect use;
- it has automated accessibility tests where feasible;
- it has manual keyboard test notes;
- high-risk patterns have screen reader test notes.

---

## Common Web Findings

Use these common findings when applicable.

### Missing form label

- Severity: High
- Relevant standard or WCAG criterion: likely WCAG 1.3.1, 3.3.2, 4.1.2
- Issue: The form field does not have a visible and programmatic label.
- Why it matters: Screen reader users may not know what information to enter. Voice-input users may not be able to target the field reliably.
- Recommended fix: Add a visible `<label>` associated with the input using `for` and `id`.
- Verification: Confirm the label is visible, programmatically associated, and announced by assistive technology.

### Focus indicator removed

- Severity: High
- Relevant standard or WCAG criterion: likely WCAG 2.4.7 and possibly 2.4.11 depending on target and context
- Issue: Keyboard focus is not visible.
- Why it matters: Keyboard users cannot determine where they are on the page.
- Recommended fix: Provide a visible focus indicator with sufficient contrast and clear placement.
- Verification: Navigate using Tab and Shift+Tab and confirm focus is visible on every interactive element.

### Vague link text

- Severity: Medium
- Relevant standard or WCAG criterion: likely WCAG 2.4.4
- Issue: Link text does not describe the destination or purpose.
- Why it matters: Screen reader users often navigate by links out of context.
- Recommended fix: Rewrite link text to describe the destination or action.
- Verification: Review links out of context and confirm each purpose is clear.

### Inaccessible custom button

- Severity: High
- Relevant standard or WCAG criterion: likely WCAG 2.1.1, 2.4.7, 4.1.2
- Issue: A clickable `<div>` is used instead of a native button.
- Why it matters: Keyboard and assistive technology users may not be able to find or operate the control.
- Recommended fix: Replace with `<button type="button">` or implement full role, name, keyboard behavior, and state handling if a custom control is unavoidable.
- Verification: Test with keyboard and inspect the accessibility tree.

### Dynamic error not announced

- Severity: High
- Relevant standard or WCAG criterion: likely WCAG 3.3.1, 3.3.3, 4.1.3
- Issue: Form errors appear visually but are not announced or associated with fields.
- Why it matters: Screen reader users may not know that submission failed or how to fix errors.
- Recommended fix: Add an error summary, associate field errors with inputs, set `aria-invalid`, and move focus to the summary or first error as appropriate.
- Verification: Submit invalid form with a screen reader and confirm errors are announced and reachable.

### Color-only status

- Severity: Medium or High depending on context
- Relevant standard or WCAG criterion: likely WCAG 1.4.1
- Issue: Status is conveyed only through color.
- Why it matters: Users who cannot perceive color differences may miss the status.
- Recommended fix: Add text, icon shape, pattern, or label that communicates the status.
- Verification: View without color cues and confirm status remains understandable.

---

## Review Output Format

Use the standard format from `accessibility/core`, with web-specific details.

```markdown
## Web Accessibility Review

### Summary

- Target standard:
- Scope reviewed:
- Page, component, or workflow:
- Overall assessment:
- Highest severity:
- Manual testing required:
- Automated tools used:
- Not reviewed:

### Findings

#### 1. [Issue title]

- Severity:
- Affected content:
- Relevant WCAG criterion:
- Issue:
- Why it matters:
- Recommended fix:
- Code or content example:
- Verification method:
- Requires manual testing: Yes/No

### Manual Testing Needed

- Keyboard navigation:
- Focus order:
- Screen reader behavior:
- Reflow and zoom:
- Color contrast:
- Critical workflow completion:
- Dynamic content announcements:

### Recommended Next Steps

1. [Highest priority action]
2. [Next action]
3. [Validation action]
```

For concise reviews, use:

```markdown
| Severity | Issue | Affected Content | Likely WCAG Area | Recommended Fix |
|---|---|---|---|---|
| High | Missing field label | Email input | Labels / Name, Role, Value | Add a visible `<label>` associated with the input |
```

---

## Code Review Instructions

When reviewing web code:

1. Identify the technology context.
2. Identify the user-facing behavior.
3. Inspect semantic HTML first.
4. Inspect keyboard access.
5. Inspect labels, names, roles, states, and values.
6. Inspect error handling.
7. Inspect focus management.
8. Inspect color and responsive risks.
9. Inspect ARIA usage.
10. Inspect dynamic updates.
11. Identify what cannot be determined statically.
12. Recommend concrete code changes.

Do not only say what is wrong. Provide corrected examples when feasible.

When the code is incomplete, state assumptions.

Example:

> This review is based on the provided component only. It does not verify runtime focus behavior, rendered color contrast, or screen reader output.

---

## Framework-Specific Notes

### React

Check for:

- semantic JSX;
- labels using `htmlFor`;
- stable IDs, especially with reusable components;
- state reflected in ARIA attributes;
- focus management after state changes;
- keyboard event handling only when necessary;
- route title and focus updates;
- fragments that preserve valid structure;
- no interactive elements nested inside other interactive elements.

Avoid:

```jsx
<div onClick={handleSubmit}>Submit</div>
```

Prefer:

```jsx
<button type="button" onClick={handleSubmit}>
  Submit
</button>
```

### Vue

Check for:

- semantic templates;
- correct label/input associations;
- state-driven ARIA;
- keyboard support;
- conditional rendering that does not leave focus stranded;
- route updates;
- accessible component props.

### Angular

Check for:

- semantic templates;
- accessible Angular Material usage;
- focus management in dialogs;
- reactive form errors;
- control labels;
- live announcements where needed;
- route title updates.

### Server-rendered templates

Check for:

- valid HTML;
- template partials preserving landmark structure;
- server-side errors rendered accessibly;
- forms and labels;
- progressive enhancement;
- no JavaScript-only critical path unless justified.

---

## Test Automation Examples

Use examples only when appropriate to the project context.

### Playwright with axe-core pattern

```javascript
import { test, expect } from '@playwright/test';
import AxeBuilder from '@axe-core/playwright';

test('page has no automatically detectable accessibility violations', async ({ page }) => {
  await page.goto('/permits/apply');

  const results = await new AxeBuilder({ page })
    .withTags(['wcag2a', 'wcag2aa', 'wcag21a', 'wcag21aa', 'wcag22aa'])
    .analyze();

  expect(results.violations).toEqual([]);
});
```

Note:

- This checks automatically detectable issues only.
- It does not replace keyboard testing, screen reader testing, or workflow review.
- Tags should be adjusted to project policy and tool support.

### ESLint JSX accessibility

For React projects, consider `eslint-plugin-jsx-a11y` where compatible.

Review lint findings manually. Some are direct defects; others require context.

---

## Definition of Done for Web Accessibility

For a normal-risk web page or component:

- Semantic HTML is used.
- Page title and heading structure are meaningful.
- Landmarks are present where appropriate.
- Links and buttons are descriptive.
- Images have appropriate alternatives.
- Forms have visible and programmatic labels.
- Errors are clear and associated.
- Keyboard navigation works.
- Focus is visible.
- Color contrast is validated or flagged.
- Responsive behavior is checked.
- Automated scan has no unresolved serious violations.
- Manual testing needs are documented.

For a high-risk public service workflow:

- All normal-risk criteria are met.
- Full keyboard workflow is tested.
- Screen reader spot check is completed.
- Form error recovery is tested.
- Session timeout behavior is tested where applicable.
- Mobile/reflow behavior is tested.
- Critical documents or downloads have accessible alternatives.
- Known blockers and high-severity issues are fixed before release.
- Retesting is completed after remediation.

---

## Prohibited Web Accessibility Claims

Do not claim:

- "This website is fully WCAG compliant."
- "This web app is accessible."
- "This passes WCAG."
- "This is ADA compliant."
- "This is Section 508 compliant."
- "This works with screen readers."
- "This is keyboard accessible."

unless the claim is supported by documented scope, methods, test results, and qualified review.

Prefer:

- "No automatically detectable issues were found in the tested scope."
- "This appears aligned with WCAG 2.2 AA in the areas reviewed."
- "Keyboard and screen reader testing are still required."
- "The provided code addresses the identified accessibility issue."
- "This component should be tested in the rendered application before release."

---

## Required Final Language

When completing a web accessibility review, include one of these statements.

### Limited code or static review

> This is a limited accessibility review based on the provided code or content. It does not verify rendered behavior, keyboard interaction, screen reader output, responsive behavior, or full WCAG conformance unless those tests were explicitly performed.

### Automated scan review

> Automated testing identifies some accessibility issues but does not prove WCAG conformance. Keyboard testing, screen reader checks, focus review, and workflow testing may identify additional issues.

### Production support

> This code was structured with accessibility in mind, but it should be validated in the rendered application before release, especially for keyboard operation, focus order, color contrast, responsive behavior, dynamic updates, and assistive technology behavior.

### High-risk workflow

> This workflow should not be released until blocker and high-severity accessibility issues are remediated and retested through keyboard, screen reader, form-error, and responsive checks.

---

## Maintainer References

Use official or authoritative references when interpreting requirements:

- W3C Web Content Accessibility Guidelines WCAG 2.2
- W3C Understanding WCAG 2.2
- W3C Techniques for WCAG
- W3C WCAG-EM
- W3C WAI-ARIA
- WAI-ARIA Authoring Practices Guide
- MDN HTML and ARIA accessibility documentation
- Deque axe-core documentation
- Playwright accessibility testing documentation, when using Playwright
- Organizational accessibility policy
- Organizational web design system
- Organizational brand and plain-language standards

When organizational policy is stricter than this skill, follow the organizational policy.

---

## Maintenance Notes

Review this skill when:

- WCAG guidance changes;
- organizational policy changes;
- legal or procurement requirements change;
- design-system components change;
- frontend framework standards change;
- automated testing tools change;
- recurring web accessibility defects are found;
- accessibility reviewers identify gaps.

At minimum, review annually.

Track changes in version control.
