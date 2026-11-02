# Marin Spec Skill

A reusable AI Skill that runs the [Marin Spec](https://github.com/marincountygov/marin-spec) workflow without the Marin Spec app: turn interview notes and project documents into a build-ready `SPEC.md` and `PROJECT-BRIEF.md`, or review an existing spec against the standard.

The skill is thin on purpose. The standard, interview guide, templates, and prompts live in the `marin-spec` repo. This skill points to them, so there is one method and one copy.

## Files

- `SKILL.md`: what to read first, the six-step workflow, rules, and boundaries.

## Other platforms

The method does not change by platform. Only the packaging does.

- **Claude:** use `SKILL.md` as is.
- **ChatGPT and OpenAI tools:** paste the prompts from `marin-spec/prompts/` in order, or put the same instructions in a custom GPT or project.
- **Copilot:** paste the prompts in order, or add them as custom instructions or a prompt file.

Do not fork the standard for a platform.
