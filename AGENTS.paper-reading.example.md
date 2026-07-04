# Paper Reading Toolkit AGENTS.md Snippet

Copy the parts you need into your local workspace `AGENTS.md`. Do not treat this file as a replacement for your existing project instructions.

## Paper Reading Toolkit

Use the Paper Reading Toolkit together with the local `AGENTS.md` policy. Local instructions control language, memory routing, vault paths, and project/research boundaries. The plugin only supplies paper-reading, formatting, and Obsidian archive mechanics.

### Paper Workflow

- Use `deep-dive` when reading, discussing, critiquing, summarizing, or archiving academic papers, PDFs, arXiv links, or paper titles.
- Do not stop at a short abstract summary unless explicitly requested; prefer mechanism, structure, data flow, training objective, design rationale, evidence, limitations, and links to existing notes.
- Use `beautify-output` when the answer should be easier to scan while preserving substance.
- Use `memory-management` when a paper discussion or research insight should become durable Obsidian Markdown.

### Obsidian Vaults

Set `PAPER_READING_OBSIDIAN_VAULT` when the Academic Research vault is not at the default path:

```bash
export PAPER_READING_OBSIDIAN_VAULT="/absolute/path/to/Academic Research"
```

Recommended Academic Research structure:

```text
00 - Maps of Content/
10 - Knowledge/
10 - Knowledge/_论文/
10 - Knowledge/_概念/
```

### Boundaries

- Paper reading, formulas, concept notes, and Academic Research notes stay in the academic workflow.
- Trellis/OpenSpec project tasks do not write into Academic Research unless the user explicitly asks to archive academic content.
- Structured benchmark, market, or literature research can be handled by `Weizhena/Deep-Research-skills`; this plugin intentionally does not bundle `research`, `research-add-items`, `research-add-fields`, `research-deep`, or `research-report`.
