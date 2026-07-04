---
name: research
description: Use when the user wants preliminary structured research on a topic, such as market research, benchmark research, technology selection, or literature mapping.
---

# Research

Generate a structured research outline before deep execution.

## Workflow

1. Generate an initial framework from model knowledge:
   - main items/objects in the domain
   - candidate field framework
2. Ask the user whether to add/remove items or adjust fields.
3. If current or comprehensive coverage is needed, use web research to supplement
   missing items and fields. Include sources.
4. Ask whether an existing field-definition file should be merged.
5. Create a topic directory with:
   - `outline.yaml`: topic, items, execution config
   - `fields.yaml`: field definitions and uncertainty policy
6. Show the result for confirmation before deep research.

## Output Shape

```text
{topic_slug}/
  outline.yaml
  fields.yaml
```

Recommended follow-ups:

- `research-add-items`
- `research-add-fields`
- `research-deep`
- `research-report`

