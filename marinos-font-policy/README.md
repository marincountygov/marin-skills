# MarinOS Font Policy Skill

A reusable AI Skill for checking MarinOS app font loading and local-first runtime static-asset rules.

Use this alongside `marin-app-builder` for new apps, `app-maintainer` for existing apps, `quality-assurance` for launch checks, and `design-review` for typography consistency.

## Files

- `SKILL.md` — workflow for applying the Open Sans/local-first font and static-asset policy.
- `../references/marinos-open-sans-and-runtime-asset-policy.md` — shared policy reference.
- `../snippets/open-sans-self-hosted.css` — local fallback snippet when a shared bundle is unavailable.
- `../scripts/check-marinos-font-policy.sh` — optional static check for app repos.
