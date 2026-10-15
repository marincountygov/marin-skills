---
name: marin-learn-content
summary: Draft, build, and review Marin Learn Notes, the decks built from them, and quizzes.
description: Use this skill when the user asks to write, update, review, or add a Marin Learn course, Note, notes page, deck, slide deck, or quiz; to turn a topic into a Note; to write quiz questions; or to add a course to Marin Learn. Also use it when someone asks what Notes must contain, how long things can be, or how decks and quizzes are made.
---

# Marin Learn content

## Purpose

Help create and review the content of a Marin Learn course: a **Note**, the **deck** built from it, and the **quiz** built from it.

**This skill is the workflow. It is not where the standard lives.** The rules are canonical in [`marin-digital-standards/content-design/learning-content.md`](https://github.com/marincountygov/marin-digital-standards/blob/main/content-design/learning-content.md). The exact limits are enforced by Marin Learn and written in `marin-learn/docs/notes/SPEC.md` and `marin-learn/schema/marin-learn-v1.schema.json`. Read those first. Do not copy the numbers into other files.

## Hard rules

- **Never invent** an example, citation, quote, link, or statistic. Use only sources you have read. If a page cannot be read (blocked, retired, or empty), leave it out, say so, and ask the owner. Examples are supplied by the owner. With none, the section is hidden.
- **Grade 6 reading level**, active voice, short sentences. Titles and headings in sentence case.
- **Quiz questions talk about the topic**, such as "data" or "a schema", never "the notes" or a section. Quizzes have **at most 10 questions** and **no select-all questions**.
- **No "view"** in button or link text. No emoji in content.
- Content that needs the owner's approval is a **draft** until they approve it. Say which parts you wrote.

## Workflow: a new Note

1. **Collect sources.** Ask for the source links. Read each one. Write down what each says in your own words, and note any that were blocked or that say they are moving.
2. **Draft the Note** in the order of the standard: Overview, Why it matters, Problem, Solution, User stories, Key terms, Do's and don'ts, Questions to ask, Examples (only what the owner gives you), Checklist, Mantras, Sources. Ground each claim in a source you read. Put reference pages under Sources, not Examples.
3. **Add code samples** only when they help, in a County setting, with sample data. Check that a sample record follows the sample schema (the Marin Learn tests do this).
4. **Check the limits and reading level:** `node scripts/validate_package.mjs packages/<course>.zip` in `marin-learn`. Fix every error. Treat warnings as work to do, not noise.
5. **Show the owner the draft** with a short list of what you wrote and what came from sources, and the open questions.

## Workflow: the deck

Do not write slides by hand. Build them from the Note:

```bash
node scripts/build_note_deck.mjs packages/<course>.zip --abstract "Slides for walking a team through <title>."
```

It splits sections evenly at 45 words per slide, keeps Checklist, User stories, and Questions to ask on one slide each, limits Key terms to three slides, and gives each slide a footer. Run it again whenever the Note changes. Check the slides in the viewer: nothing scrolls, and titles are unique.

## Workflow: the quiz

1. Write the questions in `source/quizzes/<course>.json`: 10 questions, 1 point each, passing at 70%.
2. Cover every teachable section: Why it matters 1, Problem 1, Solution 1, Key terms 3, Do's and don'ts 2, Questions to ask 1, Checklist 1. Mix 8 single-choice with 2 true or false.
3. Each question has one source section, four plausible choices (the right one not always in the same place), a hint, and an explanation that names the section. Answers come only from the Note.
4. Build it: `node scripts/build_note_quiz.mjs packages/<course>.zip source/quizzes/<course>.json`, then rebuild the deck so the package stays consistent.
5. Show the owner the questions with the answer key before publishing.

## Workflow: a new course

1. Create the package with a Note, then build its deck and quiz as above.
2. Give it a theme from `themes.json` (add the theme first if it is new) and, if it needs one, a course icon.
3. Publish with `python3 scripts/publish.py packages --out .`. Restore any regenerated files you did not mean to change.
4. Run `node scripts/validate_package.mjs` on it, then the Marin Learn tests (`bash scripts/check.sh --browser`). Tell the owner about any that you did not run.

## Review checklist

Run the checklist at the end of `learning-content.md`. In short: every limit met; grade 6; sentence case; every source read and every link working; no invented example or citation; code samples checked; the deck covers every section once; the quiz has 10 or fewer questions with every quizzable section covered; no question refers to "the notes."

## Related

- `plain-language-review`: for the wording itself. Learn content targets grade 6.
- `marin-app-builder`: for the Marin Learn app's pages, cards, and "On this page" lists.
- `accessibility-review`: for the finished pages.
