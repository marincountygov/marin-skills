# Marin Skills

AI workflows that create, transform, review, or evaluate work using Marin's digital standards.

This repo answers: **what should AI do with Marin's standards?** It applies standards; it doesn't own them — canonical policy (accessibility requirements, plain language, brand, product design) lives in [marin-digital-standards](https://github.com/marincountygov/marin-digital-standards), and UI implementation lives in [marin-ui](https://github.com/marincountygov/marin-ui).

> This repo was seeded from `marinskills`, which remains live for now and will be archived once every skill has migrated to `marin-skills`. See `marin-repo-architecture-plan.md` in the top-level `marin/` working directory for the full migration plan.

## MarinOS app font and runtime asset policy

When a skill creates, reviews, or maintains a MarinOS app, it must follow the current platform standard: body and user-interface text use Open Sans from the local `marin-ui`/`marin-app-template` bundle, not from Google Fonts, Adobe Fonts, or another runtime CDN. Shared UI assets should be first-party, local files unless an external data/API integration is an intentional part of the product design.

Use `marinos-font-policy/` for focused font/runtime-asset review, `marin-app-builder/` when starting a new app, `app-maintainer/` when updating an existing app, and `security-review/` for security-specific depth (CSP construction, exceptions, untrusted-content handling) that the other two route into rather than duplicate.
