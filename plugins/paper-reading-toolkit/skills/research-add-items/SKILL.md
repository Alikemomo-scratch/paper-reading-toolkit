---
name: research-add-items
description: Use when an existing research outline needs additional research objects or items added without rebuilding the whole outline.
---

# Research Add Items

Use after `research` has created an `outline.yaml`.

## Workflow

1. Locate `*/outline.yaml` in the current working directory.
2. Read existing items and topic context.
3. Ask the user which items to add, or whether web search should supplement candidates.
4. Deduplicate against existing items.
5. Show proposed additions for confirmation.
6. Update `outline.yaml` in place after confirmation.

Keep item entries consistent with the existing schema.

