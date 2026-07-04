---
name: research-report
description: Use when structured research JSON results should be converted into a Chinese Markdown report and optionally archived into Obsidian.
---

# Research Report

Summarize deep research results into a Chinese Markdown report.

## Workflow

1. Locate `*/outline.yaml`, read topic and output directory.
2. Read all JSON results.
3. Extract short fields suitable for table-of-contents summaries.
4. Ask the user which summary fields to display.
5. Generate a conversion script in the topic directory.
6. Produce `{topic}/report.md`.
7. Ask whether to archive to Obsidian.
8. If yes, use `memory-management`.

## Report Requirements

- The report must be written in Chinese.
- Preserve proper nouns and raw values in their original language.
- Include a table of contents with anchors and user-selected summary fields.
- Cover all fields from every JSON.
- Skip fields containing `[uncertain]` and fields listed in the `uncertain` array.
- Support both flat JSON and nested category JSON.
- Put fields not defined in `fields.yaml` into `其他信息`, excluding internal fields.

## Obsidian Archive

When archiving, preserve the full report content. Add a short `研究概览` and
`关键发现` before the report body. If the note would exceed roughly 2000 lines,
split into a summary note and a linked detail note.
