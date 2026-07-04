---
name: memory-management
description: Retrieve or write durable academic memory in the user's Obsidian Academic Research vault, including paper discussions, concept notes, formulas, literature insights, research questions, and explicit archive or remember requests.
---

# Memory Management

Durable academic memory lives in Obsidian-compatible Markdown files. Keep the
main workflow here; load academic details from `references/academic.md` when the
current task needs them.

## Select The Reference

At the start of a task, decide whether durable academic memory is relevant.

- For papers, PDFs, arXiv links, academic concepts, formulas, literature
  discussions, research synthesis, or archive requests, read
  `references/academic.md`.
- If the task is temporary, trivial, or has no cross-session academic reuse
  value, do not retrieve or write durable memory.

Do not use non-Obsidian stores as durable memory.

## Core Workflow

1. Decide whether retrieval or writing is needed.
2. Read `references/academic.md` before acting.
3. Resolve the Academic Research vault path from the reference.
4. Search filenames and contents before creating new notes.
5. Read at most 1-3 relevant notes or targeted sections.
6. Prefer updating an existing object note over creating a near-duplicate.
7. Write only durable reasoning, insights, objections, comparisons, formulas, and research questions.
8. Update the relevant MOC or index when a new durable note is created.
9. Verify frontmatter, tags, wikilinks, formulas, and MOC links before claiming completion.

Do not announce retrieval unless it affects the answer or the user asks what was found.

## Shared Note Principles

- Update over create: update the relevant object note if it exists.
- One note per real-world object: paper, concept, method, dataset, formula, or coherent research topic.
- Preserve reasoning, not just conclusions: context, alternatives, logic, evidence, and implications.
- Keep frontmatter keys in English.
- Write note titles and body content in Chinese by default unless the user asks otherwise.
- Use Obsidian `[[wikilinks]]` for related concepts and notes.
- MOCs contain navigation and short summaries, not copied note bodies.

## Required Frontmatter

New durable academic notes should include:

```markdown
---
type: paper | concept | research-object
cssclasses:
  - academic
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - paper
---
# Title
```

The first tag must match `type`. Choose the concrete `type`, `cssclasses`, and
first tag according to `references/academic.md`.
