# Maps

Interactive maps of point locations (markers on a map library such as Leaflet), including the details and controls around them. Requirements live in `marin-digital-standards/accessibility/maps.md` and `marin-digital-standards/product-design/maps.md`. For building one, use `marin-skills/map-views`. For area maps and choropleths, see `data-visualization`.

A map is an alternate visualization. The first question is always: can a person reach every record without it?

## Review workflow

1. Confirm every mapped record is also in the list and that the map has its own text alternative (a list or a dropdown of locations, alphabetical, defaulting to all locations) that selects the same details, and that changing it is announced without moving focus away.
2. Keyboard only: reach the map, Tab to each marker, choose it with Enter and with Space, read the details, use a link or button inside them, leave the map. Confirm focus is visible on the basemap in light and dark mode, and that Tab never gets stuck.
3. Check focus after choosing a marker (it moves to the details) and after Escape or Clear (it returns to the marker).
4. Accessibility tree: each marker exposes the role `button` and a meaningful name ("Event, at Place" or "Place, 3 engagements"), never "Marker" or "Map pin". Zoom controls have names. The selected location and any counts are exposed as text.
5. Screen reader: VoiceOver with Safari at minimum. Activate a marker with the screen reader's own command and confirm focus reaches the details. Confirm counts are announced once as a status message, not on every pan or zoom.
6. Touch: choose a marker, pan and zoom with two fingers, and confirm one-finger scrolling still moves the page past the map. Confirm targets are at least 24 CSS pixels.
7. Clusters: each cluster is a button named by what it holds, Enter and Space zoom in, focus lands on the map and is not lost when the cluster splits, a place chosen from the list or a link is revealed and selected, and nothing appears only on hover.
8. Full window: it opens as a modal dialog with a name, the background is inert, Tab stays inside, Escape closes it, focus returns to the button that opened it, the button's name changes ("Full window", "Exit full window"), and the details, list and controls are all still there. Check it at 320 px and 400% zoom.
9. Scroll trapping: with the pointer over the map, the wheel scrolls the page until the map is clicked or focused.
10. Motion: with reduced motion set, pan and zoom do not animate.
11. Reflow: 320 CSS pixels wide, then 200% and 400% zoom. No horizontal page scroll and the map does not push the controls off screen.
12. Contrast and color: markers are identical in look and every cluster looks the same; nothing depends on color, hover, or a popup; attribution is readable.

## Common findings

- **Markers not keyboard operable.** The library only maps Enter to a click for popups. The app has to handle Enter and Space on the marker.
- **Marker has no useful name.** `alt` only works on image icons; custom icons need `aria-label`.
- **Library or framework button styles leak onto markers and zoom controls.** Check computed styles.
- **Focus ring invisible on tiles** in dark mode because the ring uses the page text color.
- **Screen reader activation looks like a click with no pointer.** Without handling, nothing is announced and focus stays on the marker.
- **Wheel zoom or one-finger drag traps page scrolling.**
- **Counts removed or never announced.** The list is shorter than people think, with no message saying so.

## Limits to state in a report

Browser automation and an automated scan (axe, WAVE, Lighthouse) cannot judge marker names in context, screen reader announcement, or touch behavior. Say what was and was not tested, and do not report a conformance result.
