---
name: map-views
summary: Add or review a map of point locations in a MarinOS app (Leaflet, vendored), including location data, markers, keyboard and screen reader behavior, basemap choice, and the content security policy change.
description: Use this skill when adding a Map view to a Marin app, building or reviewing a map of events, facilities, or other point locations, choosing a basemap or tile provider, validating coordinates, or reviewing the accessibility of a Leaflet map. For choropleths, service areas, and boundary maps, use data-visualization instead.
---

# Map views

## Purpose

Add a map of point locations to a MarinOS app as one more view of records the app already has, and review one that exists. `marin-reach` is the working example: read its `assets/app.js` (map section), `assets/selectors.js` (`mapPoints`, `mapSummary`, `markerLabel`, `directionsUrl`, `buildPlaceBlock`), `scripts/build_data.py` (location handling), `tests/browser_reach.py` and `docs/decisions.md` before writing new code.

**This skill is the workflow. It is not where the requirements live.** They are canonical in [marin-digital-standards/product-design/maps.md](https://github.com/marincountygov/marin-digital-standards/blob/main/product-design/maps.md) and [marin-digital-standards/accessibility/maps.md](https://github.com/marincountygov/marin-digital-standards/blob/main/accessibility/maps.md). If this skill conflicts with them, the standards win; update the skill.

Use `data-visualization` for area maps (choropleths, service areas, boundaries). Use `accessibility-review` (its `subskills/maps.md`) for a deeper accessibility pass and `security-review` for the policy change.

## Before building

1. Get approval for the map, the library, and the tile host. A new app dependency and a new `img-src` host are not changes to make quietly. Record them in the app's decision log.
2. Confirm every view reads one filtered record set (for a data-browsing app, `applyFilters()`). The map gets no filters or counting path of its own.
3. Decide the basemap provider with the owner and read its usage policy. `marin-reach` uses OpenStreetMap's standard tiles (light use only); the USGS National Map is the fallback. Say in the decision log what to switch to if traffic grows.

## Build workflow

1. **Location data first.** Keep `location` (the venue name) and a structured place: kind (`physical` or `virtual`), optional address, optional `geo` (`latitude`, `longitude`). Validate: numbers, in range, together, or the build fails with the record id. Records with no coordinates, virtual, or no location are valid and get no marker. Never guess coordinates and never geocode in the browser. If you look coordinates up, use an authoritative geocoder, check a second source, and record that a person should confirm them. Report coordinates outside Marin County for review instead of rejecting them.
2. **Pure selectors.** `mapPoints(records, today)` groups records at identical coordinates and lists the rest with a reason (`virtual`, `no-coordinates`, `no-location`); upcoming engagements come first. Add `mapSummary` (counts), `markerLabel`, a directions URL builder, and a whole-location copy block. Unit-test zero, one, many, same-coordinate, and unmapped cases.
3. **Vendor Leaflet.** Put `leaflet.js`, `leaflet.css`, and `LICENSE` in `vendor/leaflet/` at a pinned version (1.9.4 in Reach). Do not load it from a CDN. Add it to `THIRD_PARTY_NOTICES.md`. The template check expects `vendor/marinos/marinos.css` then `assets/app.css` first, so load `leaflet.css` third and the script with `defer`.
4. **Tab and URL state.** Add Map between Calendar and Stats, `view=map` in the URL, and a `tabpanel`. Switching tabs keeps filters.
5. **Create the map lazily** the first time the tab is shown, call `map.invalidateSize()` whenever the panel becomes visible, keep one instance, and update markers in place when filters change. Refit only when the set of locations changes, so panning is not undone. Zero locations: show Marin County and an empty-state message with a way to the list. One location: a close zoom (about 15), not the building.
6. **Markers.** One `divIcon` with an inline SVG pin, using a brand token such as `--marin-blue`, with a white outline. No color, size, or shape meaning. Give each marker an `aria-label` (and `title`) by hand: the event and place for one record, the place and count for several. Leaflet's `alt` option only works for `<img>` icons.
7. **Keyboard and screen readers.** Leaflet only turns Enter into a click for popups, so handle Enter and Space yourself and stop propagation. Marker and cluster elements are created again each time they are added to the map, so listen once on the map container (event delegation) and decorate each element (`aria-label`, `data-place`, selected class) in the marker's `add` event, not once at creation. A mouse click selects without moving focus. A keyboard choice, or a click whose `originalEvent.detail === 0` (how VoiceOver activates), moves focus to the details heading. Escape in the details, and the Clear button, return focus to the marker. Add Space support to the zoom links.
8. **Clusters.** Vendor Leaflet.markercluster 1.5.3 (script and `MarkerCluster.css`, plus its license; skip its default colored styles) and put every marker in the cluster layer, so nearby markers group even with few locations (Reach first clustered only from 12 locations and the owner expected to see clusters with 7, so do not add a threshold unless asked). Use one cluster look (Marin blue circle, white count, 4.6:1), the number of engagements, and a name inside the icon as visually hidden text ("3 locations, 7 engagements. Press Enter to zoom in."). Turn off the hover coverage area and spiderfy. Enter and Space call the cluster's `zoomToBounds`, then move focus to the map container on `moveend`, because the cluster element disappears. Choosing a place from the Locations list or Show on map calls `zoomToShowLayer` first so the marker exists, then selects it. Turn off cluster animation for reduced motion.
9. **Details as page content, not popups.** Show the selected location below the map: name, address, an icon-only Get directions button (Lucide `signpost`, styled like the Copy button) directly below the address, count, Copy, then each engagement as the same card the list uses (with its Copy button, without checkboxes, a Show on map button or its own directions button, since the location's is just above). Nothing shows until a marker is chosen.
10. **Text alternative.** A "Locations" dropdown (a labelled `<select>`: "All locations" first and by default, then each place alphabetically with its count) does what the markers do and stays in step with them. Choosing a place selects it and pans the map; choosing "All locations" clears the selection and refits. Do not move focus away from the select on change, so arrowing through the options is not interrupted; announce the change in a visually hidden `role="status"` line instead.
11. **Counts.** A status line directly under the app's "Showing:" line, `role="status"`, from the filtered records: "N of M engagements shown on map. K do not have a map location (reasons)."
12. **Full window.** Put the map, its buttons, the Locations dropdown and the details in one wrapper, and move that wrapper into a `<dialog>` opened with `showModal()` (not the browser Fullscreen API). The dialog gets a name, the page behind it is inert, Escape closes it, and on close move the wrapper back, call `map.invalidateSize()`, and focus the button. The button uses the Lucide `fullscreen` icon and reads "Full window"; open, it uses `minimize` and reads "Exit full window". Do not save it in the URL. Size the map with `max(18rem, calc(100dvh - 11rem))` inside the dialog and let the panel scroll, and do not scroll the details into view on a pointer click in the dialog. If a Copy fallback box exists on the page, move it into the dialog while it is open.
13. **Toolbar and buttons.** The Map tab's toolbar is just Link. Under the map: Re-center (compass icon, refits all markers) and Clear (circle-x icon, shown only with a selection). Use the app's `mm-copy-button` look. Icon-only controls get an `aria-label`; per-listing "Show on map" is an icon-only map-pin button styled like Copy. No "view" in any label.
14. **URL state for the selection.** `place=<latitude>,<longitude>` on the map view only, validated on read, dropped when the filters remove that location.
15. **Scrolling and touch.** Turn off wheel zoom until the map is clicked or focused (re-disable on mouse out and blur), and turn off one-finger drag on touch devices (`L.Browser.mobile`). Turn off zoom and fade animation when `prefers-reduced-motion` is set.
16. **CSS.** Pico styles every `[role=button]` as a filled button, which turns markers, clusters and zoom controls into blue boxes. Reset `.leaflet-marker-icon[role=button]` and `.leaflet-bar a[role=button]` (then style clusters with a more specific selector), give the focus ring a black outline with a white edge (tiles are always light), keep the map height responsive (`clamp(18rem, 60vw, 32rem)`), and set all styles in CSS, never as `style` attributes.
17. **Basemap and CSP.** Add the one tile host to `img-src` in `security.json` and run `scripts/sync-security-meta.py --write`. Show the exact diff to the owner first. Keep the provider's attribution visible. Describe the privacy effect (the host sees visitor IPs) in the decision log.
18. **Tests.** Node tests for the selectors (including the cluster name); Python tests for validation (every coordinate case, virtual, no location, out of range, pair, type); one Playwright workflow that covers the Map tab, markers and their names, keyboard choice and focus, Escape and Clear, filters in place, URL restore, the text list, counts, scroll behavior, and 320 px overflow. Wait for debounced search and for CSS transitions before reading computed styles. A test that fixes the clock freezes Leaflet's animations, so emulate reduced motion for the cluster steps. To test clusters with more locations than the data has, route the data file and add synthetic records. Also cover cluster names, Enter on a cluster and where focus lands, choosing a clustered place from the list, the full window opening and closing with Escape, focus return, and the page behind being inert. Under the app's CSP the console must stay free of violations.
19. **Documentation.** Map section in the README, `decisions.md`, and the data dictionary (location versus geographic area, coordinate rules), plus the dependency and tile provider notice.

## Review checklist

```text
The map is a view of the same filtered records as the other views; it has no filters or counts of its own.
Coordinates are optional, validated (numbers, range, pair), never guessed, never geocoded in the browser.
Virtual and unlocated records are in every other view and get no marker; the status line says how many and why.
Leaflet is vendored with its license and listed in THIRD_PARTY_NOTICES.md; no CDN.
The tile host is the only addition to img-src; the provider's usage policy and attribution are recorded and visible.
There is no browser geolocation.
Every marker is a focusable button with a meaningful name, chosen with Enter and Space, and a screen-reader click moves focus to the details.
Escape or Clear returns focus to the marker; Tab always leaves the map.
Markers look identical; nothing relies on color, hover, or a popup.
A text alternative (a labelled dropdown of locations, alphabetical, defaulting to all locations) does what the markers do.
Nearby markers group into clusters that look the same, are named by what they hold, zoom in on Enter, Space and click, and focus is not lost when they split; a clustered place can still be chosen from the list.
The full window is a modal dialog with a name, Escape closes it, focus returns to its button, and it keeps the details, list and controls; it works at 320 px and 400% zoom.
Wheel and one-finger drag do not trap page scrolling; reduced motion is respected.
The selected place is in the URL on the map view only and restores on reload.
Pico button styles do not leak onto markers or zoom controls; the focus ring is visible on light tiles in both color schemes.
Reflow at 320 px and 200% and 400% zoom works with no horizontal page scroll.
Directions and other outside links open in a new tab, say so, and send nothing until chosen.
No "view" in labels; labels follow the app's wording rules.
Screen reader testing (VoiceOver with Safari) and a real touch device were done, or the report says they were not.
```

## Reporting

State what was verified and what was not. Browser automation and an automated scan are not a conformance result and do not replace a screen reader and touch test. Do not call the map accessible or the policy change a security review.

## Boundaries

This skill does not own the standards (`marin-digital-standards`), the UI system (`marin-ui`), or the template. If a second app needs the map, that is the signal to move the Leaflet CSS reset and marker pattern into `marin-ui`, not to copy it again.
