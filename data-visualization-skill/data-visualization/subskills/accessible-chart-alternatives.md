# Accessible Chart Alternatives Subskill

## Purpose
Provide text, table, caption, and summary alternatives so the core meaning of a chart, map, or dashboard is available without relying only on the visual display.

This subskill covers data-display alternatives only. Route broader accessibility compliance questions to the relevant accessibility skill.

## Use when
- A chart, map, or dashboard needs a plain-language summary.
- A graphic needs equivalent information for users who cannot interpret the visual.
- The chart uses color, shape, location, or spatial relationships to convey meaning.
- A public page needs a concise explanation of what the data shows.

## Alternative types

### Short summary
Use for simple charts. State the main finding, date range, geography, and key numbers.

Pattern:
"From [start] to [end], [measure] [increased/decreased/remained stable] from [value] to [value]. The highest value was [value] in [period]."

### Long description
Use when the chart has multiple series, complex relationships, or important caveats. Describe the structure, major patterns, and exceptions.

### Equivalent table
Use when exact values matter or the chart contains a limited number of data points. Keep tables scoped and readable.

### Caption
Use a caption to explain what the graphic shows and how to interpret it. Do not repeat every value unless the chart is simple.

### Data note
Use a data note for source, update date, definitions, exclusions, methodology, or limitations.

## Writing rules

- State the main takeaway first.
- Include key values, not every value.
- Identify the chart type only if useful.
- Avoid vague language such as "significant" unless statistical significance was tested.
- Avoid saying "as shown above" or "click the red line" without an alternative cue.
- Explain color or symbol meaning in text.

## Output pattern

Provide:
1. Short summary.
2. Optional detailed description.
3. Optional equivalent table structure.
4. Data source and caveat note.

## Canvas charts in MarinOS apps

A canvas has no text of its own. Set `role="img"` and an `aria-label` of the form "Title. Summary." (for example "Top: District 3 with 4, of 4 shown."), and recompute it on every render so it never goes stale as filters change. Add a table of the plotted values next to the canvas, inside a `visually-hidden` wrapper `<div>` (the class does not clip a `<table>` element and can add sideways scrolling on narrow screens). Set the chart library's default text and grid colors from the page's computed colors, since its default dark grey text disappears in dark mode, and rebuild charts when the color scheme changes. Do not rely on the chart's colors alone to carry meaning.
