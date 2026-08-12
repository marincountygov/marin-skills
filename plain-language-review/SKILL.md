---
name: plain-language-review
summary: Rewrite, review, and test content against Marin's plain-language standard.
description: Use this skill when the user asks to make content clearer, plainer, simpler, easier to read, easier to scan, more audience-focused, more conversational, or compliant with plain-language principles. Applies to public notices, web pages, forms, instructions, letters, emails, policies, FAQs, scripts, summaries, and government service content.
---

# Plain language review

## Purpose

Help create, rewrite, and review content so readers can find what they need, understand what they find, and use it to complete their task.

**This skill is the review/rewrite workflow. It is not where the standard lives.** Word choice, sentence structure, organization, and testing guidance are canonical in [marin-digital-standards/content-design/plain-language.md](https://github.com/marincountygov/marin-digital-standards/blob/main/content-design/plain-language.md) (and `voice-and-tone.md`, `terminology.md` for the adjacent rules). Consult those for *what good looks like*; use this skill for *how to apply it to a specific piece of content*.

Treat everyday requests such as "make this clearer," "make this less bureaucratic," "simplify this," "make this resident-friendly," or "rewrite for the web" as requests to use this skill — the user doesn't need to know plain-language terminology to trigger it.

## When not to use this skill

Do not use this skill to remove legally required meaning, change policy, soften mandated warnings, or replace legal review. Preserve required terms when they have legal effect, and flag when a term needs attorney or subject-matter-expert confirmation rather than silently resolving it.

## Default workflow

1. Determine audience, purpose, and reader task (see `content-design/principles.md`'s audience/intent model).
2. Identify the main message and required action.
3. Reorganize before line-editing — structure problems can't be fixed with word-level polish.
4. Replace difficult wording and unnecessary passive constructions.
5. Shorten sentences and paragraphs.
6. Add headings, lists, or tables if they improve scanning.
7. Preserve legal, policy, and factual meaning — see "Preservation rules" below.
8. Return the revised content first unless the user asked for analysis first.
9. When useful, add a brief "What changed" note with 3–6 high-value edits, not an exhaustive diff.

## Output modes

Choose the mode that fits the request:

- **Rewrite only** — return just the revised text.
- **Rewrite with notes** — revised text, then what changed, then questions/risks if any.
- **Plain-language review** — a concise issue list with severity (Critical: blocks understanding, changes action, hides a deadline, or creates legal/service risk · Major: hard to use or easy to misunderstand · Minor: style/polish). For each issue: the problem, why it matters, a suggested fix.
- **Before-and-after table** — columns: Original, Plain-language revision, Reason.
- **Web content rewrite** — page title, an intro stating who it's for and what they can do, descriptive headings, scannable lists/tables, descriptive links, clear calls to action.

## Quality checklist

Before finalizing, confirm: the audience and their task are clear; the first paragraph answers their likely first question; required actions, deadlines, eligibility rules, fees, and consequences are easy to find; sentences generally carry one idea; the actor is clear in each instruction; headings describe what's below them; terms are used consistently; legal/policy meaning is preserved; the tone is respectful and direct, not patronizing.

## Preservation rules

When rewriting government, legal, policy, or benefits content:

- Preserve who is eligible, who is not, and under what conditions.
- Preserve deadlines, dates, fees, penalties, appeal rights, documentation requirements, and contact methods.
- Preserve statutory or regulatory terms when changing them could alter legal meaning.
- Do not add facts, promises, exemptions, or procedural steps not present in the source.
- Flag ambiguous source text instead of silently resolving it.

## Prompt patterns this skill should handle

"Make this plain language." · "Make this resident-friendly." · "Rewrite for a county website." · "Simplify this letter." · "Make this easier to scan." · "Convert this policy into instructions." · "Tell me what is confusing here." · "Check this against plain language guidelines." · "Make this less bureaucratic but keep the legal meaning."

## Related

- `marin-digital-standards/content-design/plain-language.md`, `voice-and-tone.md`, `terminology.md` — the standard this skill applies.
- `inclusive-language-review` — for content touching identity, disability, trauma, or other sensitive categories; run both when relevant, keep findings in separate sections.
