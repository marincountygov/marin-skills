# Web

Websites, web applications, HTML/CSS/JS, design-system components, and browser-based interfaces. Requirements live in `marin-digital-standards/accessibility/*.md` (`standard.md`, `keyboard.md`, `focus.md`, `forms.md`, `color-and-contrast.md`, `wcag-2.2-mapping.md`) — this subskill covers how to review and test for them.

## Where the risk concentrates

- **Static content** (public info pages, service descriptions, news, policy pages): heading structure, vague links, missing image alternatives, low contrast, inaccessible tables, unclear reading order, reliance on PDF where HTML would serve better.
- **Web applications** (permit systems, benefits applications, payment flows, dashboards, account management): keyboard traps, focus loss, inaccessible custom controls, unannounced dynamic updates, modals/overlays that fail assistive technology, inaccessible authentication or file upload.
- **Design-system components** (buttons, accordions, tabs, modals, date pickers, tables): a pattern copied across many products multiplies one bug; a component that's accessible in isolation can still fail in context (ARIA role without the matching keyboard behavior, visual state not reflected programmatically).

## Component-specific checks

- **Accordion** — trigger is a real `<button>`, `aria-expanded` reflects state, hidden panel content isn't focusable.
- **Modal dialog** — focus moves in on open, is trapped while open, returns to the trigger on close, background is inert, dialog and close button both have accessible names.
- **Tabs** — only use the true tabs pattern (with its full keyboard behavior) when the content genuinely needs tab semantics; otherwise headings, links, or an accordion are the more honest and more accessible choice. A control placed visually among real tabs for layout reasons but that doesn't behave like one (a view toggle, a "see all" link) should not carry `role="tab"`/`aria-selected` just because of where it sits — give it ARIA matching its actual behavior (`aria-pressed` for a toggle button) instead, and place it beside the `role="tablist"` element, not inside it (a tablist may only contain tabs — Lighthouse reports this as missing required children). Real tabs also need the full keyboard pattern: one Tab stop (roving `tabindex`), Left/Right arrows with wrap, and Home/End.
- **Menus** — don't apply ARIA menu roles to ordinary site navigation; reserve them for genuine application-style menu behavior.
- **Alerts/status/toasts** — `role="status"` for polite updates, `role="alert"` for urgent ones, visible text for all users (not just assistive tech), and a toast is never the only place critical information appears.
- **Charts (canvas/SVG)** — a canvas element has no inherent accessible content; give it `role="img"` and an `aria-label` stating what the data actually shows (e.g. "30 total, peaking at 8 on Sep 20," not just "Chart"), recomputed whenever the chart's data changes — a label set once at creation goes stale the moment the data updates.
- **Repeated per-item controls** — a checkbox or select that repeats once per row/card in a list needs an accessible name that identifies *which* item it belongs to, not identical generic text ("Select item") on every instance. Especially important when the control appears before the item's own heading/title in reading order, since a screen reader user reaches the control before learning what it's for.

## Automated testing

For Marin UI / App Shell color tokens, `marin-ui/scripts/check-contrast.js [css file]` checks the real text, tint, status-badge, focus and score-ring pairs in light and dark mode and fails on a miss; run it after changing a color token.

MarinOS apps also have Lighthouse accessibility scores (PageSpeed Insights API), refreshed weekly in `marin-os`'s `data/lighthouse.json` and shown in each app's Accessibility section. Re-run it from the `marin-os` repo's Actions tab ("Lighthouse accessibility" > Run workflow) or `node scripts/lighthouse.js --app <id>`. It tests the live site in light mode only, so it doesn't replace a dark-mode contrast check, WAVE, or manual testing, and a score is never a conformance claim.

WAVE is Marin's standard automated-scan tool. Serve the page over HTTP (`python3 -m http.server 8000`) and test the `http://localhost:8000/` URL — a page opened directly via `file://` frequently grays out because the extension hasn't been granted local-file access, which reads as "untestable," not "clean." Automated scans catch roughly a third of real issues; they cannot evaluate keyboard behavior, focus management, reading order, or announcement quality. Treat a clean scan as a floor, not a finding of accessibility.

## Accessibility tree inspection

When a rendered page is available in a browser, inspect the browser-computed accessibility tree — not just the DOM or author-supplied ARIA. The tree shows the roles, names, states, values, relationships, and structure exposed through the browser's accessibility APIs.

Use the browser's accessibility inspection tools to check:

- **Presence** — meaningful content and controls appear in the tree; decorative or intentionally hidden content does not.
- **Role** — elements expose roles that match their actual function, such as button, link, heading, checkbox, dialog, navigation, or tab.
- **Accessible name** — controls and meaningful regions have accurate, distinguishable names that correspond to their visible purpose.
- **Description** — help text, instructions, and other descriptions are associated where needed.
- **State** — properties such as expanded, checked, selected, pressed, disabled, invalid, and required reflect the current visible state.
- **Value** — controls that expose a current value report the correct value.
- **Relationships** — labels, descriptions, groups, controls, headings, and other programmatic relationships resolve as intended.
- **Hierarchy** — landmarks, headings, lists, tables, dialogs, and composite widgets form a logical structure.
- **Hidden and ignored content** — anything absent from the tree is absent intentionally, and content that should be hidden from assistive technology is not exposed.

Inspect page-level structure and every distinct interactive component type. For forms and critical workflows, inspect controls and relationships more comprehensively.

For stateful or dynamic components, inspect the tree before and after interaction. Opening a dialog, expanding an accordion, selecting a tab, changing a toggle, triggering validation, or updating content must produce the corresponding change in computed accessibility properties.

Do not use accessibility-tree inspection as a substitute for keyboard or assistive-technology testing. A correct tree can still produce poor behavior in an actual workflow. If a live rendered page is unavailable, mark accessibility-tree behavior as **Needs manual testing** rather than inferring it from source code alone.

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
- Accent-colored text on a tint of the same accent (current nav link, hovered menu item, pressed filter) under 4.5:1 — use `--app-accent-on-tint`; check dark mode too, where a white-on-accent selected state can drop to about 1.7:1.
- A tablist containing a non-tab (a toggle button), or tabs with no arrow-key navigation.
- A visually hidden file input with no accessible name (and a second, invisible Tab stop).
- `aria-label` on a generic `<div>`/`<span>` with no role (a prohibited ARIA use) — give the container a role such as `list` or `group`.
- A visible meaningful element or interactive control is unexpectedly absent from the accessibility tree.
- An interactive element exposes the wrong computed role, or only a generic role, despite appearing operable visually.
- A control has a missing, misleading, duplicated, or non-distinguishing accessible name.
- The computed accessible name does not meaningfully correspond to the visible label or purpose.
- A state such as expanded, selected, pressed, checked, disabled, or invalid does not update when the visible interface changes.
- Visible help text or error text is not exposed through the expected programmatic relationship.
- Content intended to be hidden remains exposed to assistive technology, or meaningful content is unintentionally excluded from the accessibility tree.
- A modal or overlay appears visually while background content remains exposed as though it were still part of the active interface.

## Framework notes

- **React/Vue/Angular**: component abstraction doesn't exempt a component from producing accessible output — verify the rendered DOM, not just the component's props/API. Watch for client-side routing that doesn't update the document title or move focus on navigation.
- **Server-rendered templates**: usually the easiest baseline to get right since semantic HTML is the default output — the main risk is template partials that get composed in a way that breaks heading hierarchy or landmark structure.

## Output format

Use the standard finding format from `SKILL.md`. For code review specifically, cite the exact line/selector, not just "the button."