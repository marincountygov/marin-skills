---
name: marin-spec
summary: Turn project discovery material into a build-ready Marin Spec (SPEC.md and PROJECT-BRIEF.md), or review an existing spec against the Marin Spec standard, without using the Marin Spec app.
description: Use this skill when asked to write a specification, requirements document, or project brief for a County of Marin project from interview notes, transcripts, or supporting documents; to find gaps in project material before writing requirements; or to review a spec against the Marin Spec standard before handing it to a coding agent.
---

# Marin spec

## Purpose

Run the Marin Spec workflow directly: analyze the project material, resolve gaps, write the spec and brief, and review them. This skill applies the standard. It does not own it.

> The standard is the source of truth. Do not restate it here, and do not keep a copy.

## Read first

All files live in [`marin-spec`](https://github.com/marincountygov/marin-spec). Read the current versions each time.

- `standard/SPEC-STANDARD.md`: the section list, evidence rules, question classes, ID formats, and review criteria.
- `standard/INTERVIEW-GUIDE.md`: the questions to ask when there is no transcript yet.
- `templates/SPEC-TEMPLATE.md` and `templates/PROJECT-BRIEF-TEMPLATE.md`: the output shape.
- `prompts/01-analyze.md` through `prompts/05-build.md`: the instructions for each step. Follow them as written.

## Workflow

1. **Gather.** Read every file and message the user supplies. If there is no interview, offer the interview guide and ask the questions that matter. Do not invent answers.
2. **Analyze.** Follow `prompts/01-analyze.md`. Label every item Confirmed, Inferred, Recommended, or Open question. Do not write the spec yet.
3. **Resolve.** Follow `prompts/02-find-gaps.md`. Ask only blocking and important questions, in plain language. Leave implementation decisions to the builder.
4. **Spec.** Follow `prompts/03-create-spec.md` and write `SPEC.md` and `PROJECT-BRIEF.md` using the templates. Offer a Word copy of each (or formatted text the user can paste into Word) so the team can review the spec.
5. **Review.** Follow `prompts/04-review-spec.md`. List material issues first and wait for answers before rewriting. Keep existing IDs.
6. **Hand off.** For a MarinOS app, give the final `SPEC.md` to the `marin-app-builder` skill and the guidance in `prompts/05-build.md`.

## Rules

- Never turn an inferred or recommended item into a confirmed requirement without a person's answer.
- Never invent requirements, users, systems, or security controls the material and the Marin standards do not support.
- Do not infer that the built app uses AI because AI helped build it.
- Refer to `marin-digital-standards` for accessibility, content, and security. Do not copy those standards into the spec.
- Keep user-facing text in plain language, sentence case, and active voice.
- Do not commit, push, or publish anything unless asked.

## Boundaries

- Building the app belongs to `marin-app-builder`.
- A deep security review belongs to `security-review`.
- Changing the standard, prompts, or templates happens in the `marin-spec` repo, not here.
