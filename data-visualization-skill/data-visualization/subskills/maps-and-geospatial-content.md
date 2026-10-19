# Maps and Geospatial Content Subskill

## Purpose
Improve maps and location-based displays so residents can understand service areas, boundaries, conditions, resources, and geographic patterns.

## Use when
- Content includes a map, service area, district, facility location, parcel, route, hazard area, or boundary.
- A map needs a legend, caption, or non-map alternative.
- A geography-based display may be misleading or hard to interpret.

## Map decision rules

Use a map when the audience needs to understand where something is, whether an address is inside an area, how conditions vary by location, or how to reach a place.

Do not use a map as the primary display when the main task is ranking, exact comparison, or understanding a trend over time. Use a table or chart instead.

## Required context

Maps should clearly identify:
- Geography covered.
- Date or effective period.
- Data source.
- Boundary definitions.
- Legend categories and units.
- Whether values are counts, rates, percentages, or estimates.
- Known exclusions, suppressed areas, or data limitations.

## Choropleth and area maps

- Use rates or percentages when comparing areas with different population sizes.
- Avoid using raw counts for area shading unless the purpose is total volume.
- Use clear class breaks and explain them when they affect interpretation.
- Avoid implying precision beyond the data resolution.

## Service and eligibility maps

For resident tasks, include:
- Address lookup guidance when available.
- Who to contact if the map appears wrong.
- Effective dates for boundaries.
- A text list or table alternative for key service areas.

## Location markers

For facilities, drop boxes, clinics, public meetings, or services, include:
- Name.
- Address.
- Hours or appointment requirements.
- Phone or link for confirmation.
- Transit, parking, or access notes when relevant.

## Interactive point maps in apps

For a map of events, facilities, or other point locations inside a MarinOS app (markers, selection, a text list, counts of mapped and unmapped records), use `marin-skills/map-views` and `marin-digital-standards/product-design/maps.md`. Never imply the list is shorter than it is: say how many records are not on the map and why.

## Output pattern

Provide:
1. Map purpose statement.
2. Recommended map type or alternative.
3. Legend and label recommendations.
4. Text alternative or lookup support.
5. Caveats and source note.
