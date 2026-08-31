# MarinOS runtime assets

Use this QA subskill when reviewing a MarinOS app, app template, documentation page, generated prototype, or AI-produced code that includes HTML, CSS, JavaScript, fonts, icons, or static UI assets.

## Required checks

- Body and user-interface text use Open Sans through the shared `marin-ui`/`marin-app-template` bundle.
- Open Sans is loaded from the local first-party path `vendor/fonts/open-sans/OpenSans-VariableFont_wdth,wght.woff2`.
- `vendor/fonts/open-sans/OFL.txt` is present when the app repo ships the font file.
- Jost remains the local heading/display font when supplied by the shared bundle.
- App-level CSS inherits the shared font tokens instead of introducing an unrelated body font stack.
- Runtime HTML, CSS, and JavaScript do not load fonts, CSS frameworks, icon sets, or UI libraries from Google Fonts, Adobe Fonts, jsDelivr, unpkg, cdnjs, or a similar CDN.
- Any external request that remains is an intentional service/data/API integration, not a convenience dependency for static assets.

## Common findings

- **Blocker/high**: the app cannot render its required typography because the local font file is missing.
- **High**: a production app loads Google Fonts, Adobe Fonts, jsDelivr, unpkg, cdnjs, or another runtime static-asset CDN.
- **Medium**: custom CSS overrides the shared body font stack without a documented standard exception.
- **Low**: documentation does not identify where the local Open Sans license file is stored.

## Suggested verification commands

From this repo, run the checker against the target app repo:

```sh
sh scripts/check-marinos-font-policy.sh /path/to/app
```

From inside the target app repo, verify the files directly:

```sh
test -f vendor/fonts/open-sans/OpenSans-VariableFont_wdth,wght.woff2
test -f vendor/fonts/open-sans/OFL.txt
```

## Reporting pattern

Report whether the app is using the shared local font bundle, list any missing files, identify any external static-asset calls, and distinguish those from intentional data/API requests that are part of the app's function.
