# Paper Reading Toolkit Plugin

This directory is the plugin payload used by the root marketplace.

Install from the repository root:

```bash
codex plugin marketplace add Alikemomo-scratch/paper-reading-toolkit --ref main
codex plugin add paper-reading-toolkit@paper-reading-toolkit
```

Or use the root installer:

```bash
curl -fsSL https://raw.githubusercontent.com/Alikemomo-scratch/paper-reading-toolkit/main/install.sh | bash
```

The plugin bundles:

- `deep-dive`: read, discuss, critique, and archive papers, PDFs, arXiv links, and paper titles.
- `memory-management`: write durable Markdown notes into an Obsidian vault.
- `beautify-output`: turn dense paper/research answers into clearer Markdown.

For structured deep-research workflows, pair this plugin with [Weizhena/Deep-Research-skills](https://github.com/Weizhena/Deep-Research-skills). Skills such as `research`, `research-add-items`, `research-add-fields`, `research-deep`, and `research-report` belong there and are intentionally not bundled here.


## Local AGENTS.md Integration

This plugin should be used together with the `AGENTS.md` that applies to the current Codex workspace. Local `AGENTS.md` rules define the user's working style, memory policy, vault paths, and project/research boundaries; these skill instructions only provide the paper-reading mechanics.

If `AGENTS.md` defines language, Obsidian, archive, or research workflow rules, follow those local rules while using `deep-dive`, `memory-management`, and `beautify-output`.

Set `PAPER_READING_OBSIDIAN_VAULT` if your Academic Research vault is not at `~/Documents/Obsidian/Academic Research/`.

## Typical Prompts

```text
使用 deep-dive 深度阅读这篇论文：https://arxiv.org/abs/...
```

```text
归档笔记吧
```

```text
用 beautify-output 把这份论文总结重新整理成重点清晰的 Markdown
```

## Archive Rules

Paper archive notes should keep:

- metadata, one-sentence summary, core contributions, background, method details, formulas, figures or tables, experiments, discussion insights, doubts, and research implications.
- frontmatter with `type: paper`, `created`, `updated`, and `tags`.
- Obsidian wikilinks for related methods, papers, and concepts.
- an entry in `Academic Research MOC.md`.

The archive workflow is triggered when you ask Codex to save, archive, remember, or persist a sufficiently rich paper discussion.
