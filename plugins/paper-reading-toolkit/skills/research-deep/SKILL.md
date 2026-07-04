---
name: research-deep
description: Use when a research outline exists and the user wants deep research over each item with structured JSON outputs, batching, resume support, and validation.
---

# Research Deep

Use this after `research` has created an `outline.yaml` and `fields.yaml`.

## Workflow

1. Locate `*/outline.yaml` in the current working directory.
2. Read items, `fields.yaml`, and execution config.
3. Check the output directory for completed JSON files and skip completed items.
4. Execute in batches based on `batch_size` and `items_per_agent`.
5. For each item, produce `{output_dir}/{item_slug}.json`.
6. Validate each JSON against `fields.yaml`.
7. Summarize completion count, failed items, uncertain fields, and output path.

## JSON Requirements

- Cover every field defined in `fields.yaml`.
- Mark uncertain values with `[uncertain]`.
- Add an `uncertain` array listing uncertain field names.
- Keep field values in English unless the user asks otherwise.
- Include sources when available.

Use subagents only when item scopes are independent and the user expects
parallel execution.

