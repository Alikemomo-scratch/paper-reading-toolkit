---
name: deep-dive
description: Primary entrypoint for Paper Reading Toolkit. Use when the user asks to read, analyze, discuss, critique, summarize, or archive an academic paper, PDF, arXiv link, project page, or paper title; includes Memory First retrieval from Obsidian before reading.
---

# Deep Dive

Use a three-phase workflow: Read, Discuss, Archive. This skill depends on
`memory-management` for Academic Research note writing rules.

## Memory First

At the start of each paper task, silently evaluate whether durable memory is relevant. For paper reading, it usually is relevant.

Before reading:

1. Resolve the Academic Research vault from `PAPER_READING_OBSIDIAN_VAULT` or `~/Documents/Obsidian/Academic Research/`.
2. Search for exact matches by paper title, arXiv ID, filename, and common abbreviations.
3. Search for related method/concept notes from the abstract, title, keywords, and user-provided context.
4. Load at most 1-3 relevant notes or targeted sections before the first answer.
5. If an exact paper note exists, ask whether to update it or start a fresh reading thread.

Do not use non-Obsidian memory stores for durable academic memory.

## Phase 1: Read

Accept arXiv links, PDFs, paper titles, or project pages. Present:

- `一句话总结`
- `核心方法`
- `与已有知识的关联`
- `初步印象`

Ask what the user wants to discuss next.

## Phase 2: Discuss

Be an active research partner:

- Challenge weak claims with specific reasoning.
- Compare with related work from the vault and current sources when needed.
- Identify novelty versus incremental contribution.
- Assess assumptions, reproducibility, and practical applicability.
- Track key viewpoints, open questions, and connections to the user's research.

Retrieve related vault notes silently when new methods, papers, or concepts arise.

## Phase 3: Archive

Triggered when the user says to save/archive/remember, or when a long rich
discussion should not be lost and the user confirms persistence.

Use `memory-management` to write or update the paper/research-object note.
Populate both technical sections and discussion sections. Do not leave
discussion sections generic.

After writing, validate:

- Frontmatter is complete.
- First tag matches `type`.
- Required paper sections exist.
- Formulas and figures/tables are preserved when available.
- Discussion insights are populated.
- MOC is updated.
