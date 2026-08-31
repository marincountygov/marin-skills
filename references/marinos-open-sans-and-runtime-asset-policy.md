# MarinOS Open Sans and runtime asset policy

Use this reference when generating, reviewing, or maintaining MarinOS app code, app templates, AI coding instructions, or QA checklists that touch fonts, CSS, JavaScript, icons, or other static UI assets.

## Rule

MarinOS apps use **Open Sans** for body text and user-interface text. The shared `marin-ui` bundle may continue to use **Jost** for headings and display typography.

Font files and static UI assets should be first-party project assets. Do not load fonts, CSS frameworks, JavaScript libraries, icon sets, or other static UI dependencies from external runtime services.

## Required app asset paths

A MarinOS app, app template, or shared UI bundle that ships runtime assets should contain these local files:

```text
vendor/fonts/open-sans/OpenSans-VariableFont_wdth,wght.woff2
vendor/fonts/open-sans/OFL.txt
vendor/fonts/Jost-wght.ttf
```

The Open Sans font binary may be excluded from generated review artifacts when font binaries cannot be redistributed through the working environment, but app code should still reference the exact path above and the implementation handoff should state that the file must be copied into place before release.

## Required CSS pattern

Use the implementation supplied by `marin-ui` whenever possible. Do not independently invent font stacks in individual apps.

When a standalone snippet is unavoidable, use the local `@font-face` pattern in `snippets/open-sans-self-hosted.css`. The body/UI stack should route through `--app-font-body`, and Pico's sans-serif token should also use that value.

## Prohibited runtime static asset patterns

Do not add production app code that loads fonts, CSS frameworks, JavaScript libraries, icon sets, or other static UI assets from:

```text
fonts.googleapis.com
fonts.gstatic.com
use.typekit.net
p.typekit.net
cdn.jsdelivr.net
unpkg.com
cdnjs.cloudflare.com
```

This list is not exhaustive. The policy is local-first for static UI assets, not a block on intentional service/data/API integrations.

Do not add Google Fonts `<link>` tags, font-host `preconnect` tags, CSS `@import` rules for font providers, or script/style references to public CDNs for static UI assets.

## Allowed external calls

Intentional data/API integrations are allowed when they are part of the product design and the app includes loading, failure, and recovery states. Do not classify those as font/CDN violations merely because they are external requests.

## Review expectation

When reviewing generated MarinOS code, flag any one-off app CSS that bypasses the shared font tokens, any external font/CDN static asset reference, and any missing Open Sans asset path in a template or app release package.
