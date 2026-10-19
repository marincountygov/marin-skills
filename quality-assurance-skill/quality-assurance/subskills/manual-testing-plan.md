# Manual Testing Plan Subskill

## Purpose
Create practical manual test steps for publication QA when automated tests are unavailable, insufficient, or out of scope.

## Use this when

- The user asks how to test a page, form, document, service flow, or content update.
- A content owner needs a repeatable QA checklist.
- A release needs evidence that key resident tasks work.

## Testing plan structure

### Scope
Define the asset, channel, audience, task, device assumptions, browsers if relevant, and known risk areas.

### Preconditions
List required accounts, sample data, eligibility assumptions, documents, payment methods, test URLs, review environment, or publication state.

### Test cases
For each test case include:

- Test ID.
- Scenario.
- Steps.
- Expected result.
- Actual result.
- Pass/fail.
- Severity if failed.
- Notes or screenshots needed.

### Core manual tests
- Open the page or asset from expected entry points.
- Search for the page using likely resident terms.
- Follow primary calls to action.
- Complete each major task path.
- Verify required documents, fees, deadlines, and contact options.
- Check broken links, incorrect downloads, and stale references.
- Confirm confirmation, receipt, next steps, or status information.
- Test failure paths such as missing information, ineligible status, closed deadlines, unavailable services, and invalid links.
- Review mobile scanning and print/download behavior where relevant.
- When testing a MarinOS app, verify local font files and run the MarinOS font policy check if available.

### Testing a web app in a browser

- Playwright may not be installed. Use a virtual environment outside the repo (`python3 -m venv`, `pip install playwright`, `playwright install chromium`) so the repo gets no new files.
- Add an axe-core scan of the key views, in light and dark, as a check that finds the obvious. It is not a conformance result; say what it cannot see (keyboard behavior, reading order, screen reader announcements, touch).
- Wait for results instead of sleeping where possible: search is often debounced and the shell fades elements with CSS transitions.
- A test that fixes the clock also freezes animations that depend on it, such as a map's pan, zoom and cluster movement; emulate reduced motion for those steps.
- Check the browser console for policy violations (blocked scripts, styles or images) in every view, not only on the first page.
- Keep the steps a person must do (a screen reader, a real phone, 400% zoom) in the report as not tested.

## Output

Return a table of test cases and a summary section with unresolved risks and launch recommendation.
