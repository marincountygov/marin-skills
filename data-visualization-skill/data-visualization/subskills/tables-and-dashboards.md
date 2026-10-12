# Tables and Dashboards Subskill

## Purpose
Improve tables, dashboards, KPI cards, filters, and data exploration pages so users can find, compare, and interpret data without confusion.

## Use when
- Exact values matter.
- A dashboard needs layout, labels, filters, or hierarchy.
- A table is too dense, poorly labeled, or hard to scan.
- KPI cards need context or caveats.

## Table standards

- Use clear column headings with units.
- Keep similar values aligned consistently.
- Avoid unexplained abbreviations.
- Group related columns.
- Sort by the most useful default order.
- Provide filters or search only when the table is large enough to require them.
- Include source, date, definitions, and caveats close to the table.

## Dashboard standards

A dashboard should answer a defined set of user questions. It should not be a dumping ground for all available metrics.

Prioritize:
1. Key status or outcome metrics.
2. Trends or comparisons that explain movement.
3. Filters that match real user tasks.
4. Context, definitions, and caveats.
5. Links to raw data or methodology when appropriate.

## KPI cards

KPI cards should include:
- Metric name.
- Current value.
- Time period.
- Direction of change, if relevant.
- Comparison baseline, target, or prior period.
- Definition or caveat if the metric can be misread.

Avoid standalone numbers with no context.

## Filters and controls

- Use plain labels for filters.
- Set safe defaults.
- Explain whether filters affect all charts or only one section.
- Avoid too many controls on the initial view.

## Stats in MarinOS apps

- A stats tab shows KPI tiles first, then charts in single-column cards, as in `marin-mentions`. Use charts, not tables, for counts over time and for rankings, and keep the same blue for a single series.
- Give each canvas chart `role="img"`, a text summary in `aria-label` (total, peak or top item), and a `visually-hidden` data table with the same numbers. Add a PNG download under each chart, plus Copy and All PNG for the tab.
- Every number and chart on the tab must come from the same filtered records as the list. Say what a count means where it is not obvious, for example "A record with several agencies counts once for each."
- See `marin-app-builder` ("Data-browsing apps") for the full tab, filter, and button pattern.

## Empty and error states

Dashboards and tables should explain:
- No data available.
- Filters returned no results.
- Data failed to load.
- Data is delayed or under review.

## Output pattern

Provide:
1. Primary dashboard or table purpose.
2. Recommended layout or column structure.
3. Label and filter improvements.
4. KPI context requirements.
5. Data notes, caveats, and update cadence.
