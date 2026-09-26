# Security Review Skill

A reusable AI Skill for applying and reviewing Marin's security standard for MarinOS applications — profile selection, effective CSP construction, documented exceptions, and untrusted-content/AI-generated-code review.

Requirements live in [marin-digital-standards/security](https://github.com/marincountygov/marin-digital-standards/tree/main/security). This skill is the review workflow that applies them, not a second copy of the requirements.

This skill is deliberately narrow: setting up a new app's security configuration is a [`marin-app-builder`](https://github.com/marincountygov/marin-skills/tree/main/marin-app-builder) step (the template already ships a starter `security.json`), and checking an existing app's configuration against reality is an [`app-maintainer`](https://github.com/marincountygov/marin-skills/tree/main/app-maintainer) step. Both route here for anything beyond confirming the defaults still fit.

## Files

- `SKILL.md` — the standard's default, the app/hosting/org responsibility model, CSP construction, exceptions, untrusted-content handling, conformance language, and finding format.

## History

Added alongside the MarinOS security system (`marin-os/schemas/security.schema.json`, `marin-digital-standards/security/`, per-app `security.json`). Scoped narrower than an initial draft that duplicated most of `marin-app-builder`'s and `app-maintainer`'s own workflows — this version holds only the security-specific content those two skills call into.
