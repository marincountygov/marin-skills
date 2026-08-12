# Web

Websites, web applications, HTML/CSS/JS, design-system components, and browser-based interfaces. Requirements live in `marin-digital-standards/accessibility/*.md` (`standard.md`, `keyboard.md`, `focus.md`, `forms.md`, `color-and-contrast.md`, `wcag-2.2-mapping.md`) — this subskill covers how to review and test for them.

## Where the risk concentrates

- **Static content** (public info pages, service descriptions, news, policy pages): heading structure, vague links, missing image alternatives, low contrast, inaccessible tables, unclear reading order, reliance on PDF where HTML would serve better.
- **Web applications** (permit systems, benefits applications, payment flows, dashboards, account management): keyboard traps, focus loss, inaccessible custom controls, unannounced dynamic updates, modals/overlays that fail assistive technology, inaccessible authentication or file upload.
- **Design-system components** (buttons, accordions, tabs, modals, date pickers, tables): a pattern copied across many products multiplies one bug; a component that's accessible in isolation can still fail in context (ARIA role without the matching keyboard behavior, visual state not reflected programmatically).

## Component-specific checks

- **Accordion** — trigger is a real `<button>`, `aria-expanded` reflects state, hidden panel content isn't focusable.
- **Modal dialog** — focus moves in on open, is trapped while open, returns to the trigger on close, background is inert, dialog and close button both have accessible names.
- **Tabs** — only use the true tabs pattern (with its full keyboard behavior) when the content genuinely needs tab semantics; otherwise headings, links, or an accordion are the more honest and more accessible choice.
- **Menus** — don't apply ARIA menu roles to ordinary site navigation; reserve them for genuine application-style menu behavior.
- **Alerts/status/toasts** — `role="status"` for polite updates, `role="alert"` for urgent ones, visible text for all users (not just assistive tech), and a toast is never the only place critical information appears.

## Automated testing

WAVE is Marin's standard automated-scan tool. Serve the page over HTTP (`python3 -m http.server 8000`) and test the `http://localhost:8000/` URL — a page opened directly via `file://` frequently grays out because the extension hasn't been granted local-file access, which reads as "untestable," not "clean." Automated scans catch roughly a third of real issues; they cannot evaluate keyboard behavior, focus management, reading order, or announcement quality. Treat a clean scan as a floor, not a finding of accessibility.

## Manual testing

- **Keyboard**: reach and operate every interactive element using only Tab, Shift+Tab, Enter, Space, Escape, and arrow keys where a pattern calls for them. Confirm focus order matches visual/logical order and nothing traps focus.
- **Screen reader spot check**: for higher-risk workflows, verify that dynamic updates are announced, form errors are reachable, and custom components have correct accessible names — don't rely on automated tooling for this.
- **Zoom/reflow**: 200% zoom and narrow viewport widths shouldn't clip content, force horizontal scroll on normal text, or break layout.
- **Color/contrast**: verify numerically wherever exact values are available; flag for validation when they aren't.
- **Workflow test**: walk a full task end to end (not just one page) for anything transactional — a permit application, a payment flow, an account request.

## Common findings

- Missing form label (placeholder used instead of `<label>`).
- Focus indicator removed with nothing replacing it (`outline: none` and no `:focus-visible` alternative).
- Vague link text ("click here," "read more" with no surrounding context).
- Custom `<div>`/`<span>` acting as a button, missing keyboard support and accessible name.
- Dynamic error or status update not wrapped in a live region, so it's silent to assistive technology.
- Status or required-field state conveyed by color alone.

## Framework notes

- **React/Vue/Angular**: component abstraction doesn't exempt a component from producing accessible output — verify the rendered DOM, not just the component's props/API. Watch for client-side routing that doesn't update the document title or move focus on navigation.
- **Server-rendered templates**: usually the easiest baseline to get right since semantic HTML is the default output — the main risk is template partials that get composed in a way that breaks heading hierarchy or landmark structure.

## Output format

Use the standard finding format from `SKILL.md`. For code review specifically, cite the exact line/selector, not just "the button."
