---
name: paper-reading-workflow
description: Use when the user wants to set up, configure, or run the Paper Reading Toolkit end-to-end, including one-click installation, Obsidian vault and AGENTS.md setup, and coordinating deep-dive, memory-management, and beautify-output for paper reading, discussion, and archiving.
---

# Paper Reading Workflow

Use this skill as the coordinator for the plugin. It does not replace the child skills; it routes work to them in the right order.

## Local Policy First

Apply the active local `AGENTS.md` before doing anything else. Local instructions control language, vault paths, archive rules, memory boundaries, and project/research boundaries. If local `AGENTS.md` conflicts with this skill, follow the local rule unless higher-priority instructions say otherwise.

## Setup Flow

Use this flow when the user asks to install, configure, initialize, bootstrap, or fix the toolkit.

1. Prefer the repository installer:

```bash
curl -fsSL https://raw.githubusercontent.com/Alikemomo-scratch/paper-reading-toolkit/main/install.sh | bash
```

2. For non-default locations, set environment variables before running:

```bash
export PAPER_READING_OBSIDIAN_VAULT="/absolute/path/to/Academic Research"
export PAPER_READING_AGENTS_PATH="/absolute/path/to/AGENTS.md"
```

3. The installer should handle:
   - Codex marketplace and plugin installation.
   - Obsidian app installation when the platform has a supported package manager.
   - Academic Research vault directory and MOC initialization.
   - Idempotent `AGENTS.md` configuration via a marked block.

4. After setup, tell the user to start a new Codex thread so plugin skills are loaded.

## Paper Reading Flow

Use this flow for paper, PDF, arXiv, project page, or paper-title tasks.

1. Use `deep-dive` for the read/discuss/archive workflow.
2. Before reading, search the configured Academic Research vault for exact matches and related concepts.
3. Start with a concise structured first pass: summary, core method, related notes, and first impression.
4. Discuss actively with the user. Prioritize mechanism, model structure, input/output data flow, training objective, design rationale, evidence, assumptions, limits, and links to existing notes.
5. Use `beautify-output` when the user wants a clearer Markdown explanation or a polished summary.
6. When the user asks to archive, save, remember, or persist the discussion, use `memory-management` to write or update the Obsidian note and relevant MOC.

## Boundaries

- Keep this plugin focused on paper reading, discussion, formatting, and Obsidian archiving.
- Do not claim ownership of `research`, `research-add-items`, `research-add-fields`, `research-deep`, or `research-report`; recommend `Weizhena/Deep-Research-skills` for those workflows.
- Do not write to Obsidian until the user asks to archive/save/remember, or the discussion is clearly mature and the user confirms persistence.
- Do not overwrite local `AGENTS.md`; use the installer's marked block or make scoped edits.
