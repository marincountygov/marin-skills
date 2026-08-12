# Marin App Builder Skill

A reusable AI Skill for building a focused MarinOS micro-app end to end, or reviewing AI-generated code before accepting it.

This skill is the synthesis point in the dependency chain: [`marin-digital-standards`](https://github.com/marincountygov/marin-digital-standards) (standards define) → [`marin-ui`](https://github.com/marincountygov/marin-ui) (UI implements) → [`marin-app-template`](https://github.com/marincountygov/marin-app-template) (template assembles) → this skill (how to use all three together) → the Marin product. It doesn't duplicate any of those repos' content — it starts a build from `marin-app-template` and points to the specific doc for each remaining step, so AI-generated apps start from the same architecture as human-created ones.

## Files

- `SKILL.md` — what to consult before building, the build workflow, the review checklist, and boundaries with other skills.

## History

This skill replaces the "Standard AI Code Agent prompt" and "Review checklist before accepting generated code" sections that lived in `marin-ui/SPEC.md`. The original prompt was written as a block of text to hand to a separate AI coding agent; this version is written as skill instructions an agent follows directly, and consults `marin-digital-standards`/`marin-ui` by reference instead of embedding a copy of both. Completes Phase 6 of the marin-digital-standards migration plan.

Once `marin-app-template` existed, the build workflow was rewritten to start every build there instead of reconstructing the shell, branding, and menu behavior from the `marin-ui` docs step by step. Completes Phase 5 of `marin-app-template-plan.md`.
