---
name: research-add-fields
description: Use when an existing research field definition file needs new fields or categories added.
---

# Research Add Fields

Use after `research` has created a `fields.yaml`.

## Workflow

1. Locate `*/fields.yaml` in the current working directory.
2. Read existing categories, field names, and detail levels.
3. Ask the user for desired fields, or use web research to propose common fields.
4. Deduplicate against existing fields.
5. Ask the user to confirm field category and `detail_level`.
6. Update `fields.yaml` in place after confirmation.

Preserve the current schema and naming style.

