---
name: memory-management
description: Retrieve or write durable academic memory in the user's Obsidian Academic Research vault, including paper discussions, concept notes, formulas, literature insights, research questions, and explicit archive or remember requests.
---

# Memory Management

Use this skill only for academic and paper-reading memory. Durable memory is
stored as Obsidian-compatible Markdown in the Academic Research vault.

## Vault

Resolve the Academic Research vault in this order:

1. `PAPER_READING_OBSIDIAN_VAULT`
2. `~/Documents/Obsidian/Academic Research/`

Expected structure:

- `00 - Maps of Content/` for MOCs and indexes
- `10 - Knowledge/_论文/` for paper notes
- `10 - Knowledge/_概念/` for concept, method, formula, and theme notes

Writing to the vault may be outside the current workspace. Request a narrow
filesystem-write approval before creating or updating notes when needed.

## Retrieve

Retrieve context when a paper, method, concept, formula, research theme, or
archive request is mentioned.

Before answering:

1. Search exact paper matches by title, arXiv ID, DOI, filename, and common abbreviations.
2. Search related concept or method notes using keywords from the title, abstract, user prompt, and cited methods.
3. Read at most 1-3 relevant notes or targeted sections.
4. Prefer high-signal snippets over dumping whole notes into context.
5. If an exact paper note already exists, ask whether to update it or start a fresh reading thread.

Do not announce retrieval unless it changes the answer or the user asks what was found.

## Write

Write or update Academic Research notes when:

- The user asks to archive, save, or remember a paper discussion.
- A paper discussion produces durable insights, objections, comparisons, or research questions.
- A concept, formula, method, dataset, benchmark, or literature theme should be reusable later.
- A research synthesis should become a durable Markdown note.

Skip transient chat notes, rough scratch work, and claims that have not been
settled enough to be useful later.

## Paper Notes

For paper notes, preserve:

- title, authors, venue/year when known, URL or arXiv ID, and tags
- one-sentence summary
- problem setting
- core method
- model structure, data flow, and training objective when relevant
- key experiments or evidence
- limitations and weak claims
- connections to existing notes
- user discussion insights and open questions

Do not leave discussion sections generic. Capture the concrete viewpoint that
emerged from the conversation.

## Concept Notes

For concept, method, formula, or theme notes, preserve:

- definition or working description
- where the idea appears
- why it matters
- related papers or notes
- unresolved questions

## MOC

When writing a durable note, update the relevant Academic Research MOC or index
entry. Keep links concise and avoid duplicate entries.
