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

## Output

Return a table of test cases and a summary section with unresolved risks and launch recommendation.
